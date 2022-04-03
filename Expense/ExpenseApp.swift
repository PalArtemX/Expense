//
//  ExpenseApp.swift
//  Expense
//
//  Created by Artem Paliutin on 03/04/2022.
//

import SwiftUI

@main
struct ExpenseApp: App {
    
    @StateObject var vm = TransactionViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(vm)
        }
    }
}
