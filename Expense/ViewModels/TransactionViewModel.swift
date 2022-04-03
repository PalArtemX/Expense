//
//  TransactionViewModel.swift
//  Expense
//
//  Created by Artem Paliutin on 03/04/2022.
//

import Foundation
import Combine
import Collections

typealias TransactionGroup = OrderedDictionary<String, [Transaction]>
typealias TrasactionPrefixSum = [(String, Double)]

class TransactionViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    var cancellable = Set<AnyCancellable>()
    
    init() {
        getTransactions()
    }
    
    func getTransactions() {
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (output) -> Data in
                guard
                    let response = output.response as? HTTPURLResponse,
                    response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            .sink { completion in
                switch completion {
                case .finished:
                    print("getTransactions finished")
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            } receiveValue: { [weak self] returnValue in
                self?.transactions = returnValue
            }
            .store(in: &cancellable)
    }
    
    
    func groupTransactionsByMonth() -> TransactionGroup {
        guard !transactions.isEmpty else { return [:] }
        
        let groupedTransactions = TransactionGroup(grouping: transactions) { $0.month }
        
        return groupedTransactions
    }
    
    func accumulateTransactions() -> TrasactionPrefixSum {
        guard !transactions.isEmpty else { return [] }
        
        let today = "02/17/2022".dateParsed()
        let dateInterval = Calendar.current.dateInterval(of: .month, for: today)!
        
        var sum: Double = .zero
        var cumulative = TrasactionPrefixSum()
        
        for date in stride(from: dateInterval.start, to: today, by: 60 * 60 * 24) {
            let dailyExpenses = transactions.filter({ $0.dateParsed == date && $0.isExpense })
            let dailyTotal = dailyExpenses.reduce(0) { $0 - $1.signedAmount }
            
            sum += dailyTotal
            cumulative.append((date.formatted(), sum))
        }
        
        return cumulative
        
    }
    
}
