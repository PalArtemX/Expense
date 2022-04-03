//
//  TransactionRowView.swift
//  Expense
//
//  Created by Artem Paliutin on 03/04/2022.
//

import SwiftUI

struct TransactionRowView: View {
    
    var transaction: Transaction
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                // MARK: - Transaction Merchant
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                // MARK: - Transaction Category
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                // MARK: - Transaction Date
                Text(Date(), format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical)
    }
}










struct TransactionRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TransactionRowView(transaction: transactionPreviewData)
                .previewLayout(.sizeThatFits)
            TransactionRowView(transaction: transactionPreviewData)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
        .padding()
    }
}