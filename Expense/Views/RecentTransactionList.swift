//
//  RecentTransactionList.swift
//  Expense
//
//  Created by Artem Paliutin on 03/04/2022.
//

import SwiftUI

struct RecentTransactionList: View {
    
    @EnvironmentObject var vm: TransactionViewModel
    
    var body: some View {
        VStack {
            HStack {
                // MARK: - Header Title
                Text("Recent Transaction")
                    .bold()
                
                Spacer()
                
                NavigationLink {
                    //
                } label: {
                    HStack {
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(.colorTheme.text)
                }
                
            }
            .padding(.top)
            
            // MARK: Recent Transaction List
            ForEach(vm.transactions.prefix(5)) { transaction in
                TransactionRowView(transaction: transaction)
            }
        }
        .padding()
        .background(Color.colorTheme.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}










struct RecentTransactionList_Previews: PreviewProvider {
    static var previews: some View {
        RecentTransactionList()
            .environmentObject(TransactionViewModel())
    }
}
