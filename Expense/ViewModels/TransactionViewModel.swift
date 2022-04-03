//
//  TransactionViewModel.swift
//  Expense
//
//  Created by Artem Paliutin on 03/04/2022.
//

import Foundation
import Combine

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
    
    
}
