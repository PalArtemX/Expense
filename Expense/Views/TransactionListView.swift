//
//  TransactionListView.swift
//  Expense
//
//  Created by Artem Paliutin on 03/04/2022.
//

import SwiftUI

struct TransactionListView: View {
    
    @EnvironmentObject var vm: TransactionViewModel
    
    var body: some View {
        VStack {
            List {
                // MARK: - Transaction Group
                ForEach(Array(vm.groupTransactionsByMonth()), id: \.key) { month, transactions in
                    Section {
                        ForEach(transactions) { transaction in
                            TransactionRowView(transaction: transaction)
                        }
                    } header: {
                        Text(month)
                    }

                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}










struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TransactionListView()
                .environmentObject(TransactionViewModel())
        }
    }
}
