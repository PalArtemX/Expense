//
//  PreviewData.swift
//  Expense
//
//  Created by Artem Paliutin on 03/04/2022.
//

import Foundation


var transactionPreviewData = Transaction(id: 1, date: "01/10/2022", institution: "Artem", account: "Visa Black", merchant: "Apple", amount: 12.45, type: "debit", categoryId: 801, category: "Softvare", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
