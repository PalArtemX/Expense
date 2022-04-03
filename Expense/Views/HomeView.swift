//
//  HomeView.swift
//  Expense
//
//  Created by Artem Paliutin on 03/04/2022.
//

import SwiftUI
import SwiftUICharts

struct HomeView: View {
    
    @EnvironmentObject var vm: TransactionViewModel
    //var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    // MARK: - Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    // MARK: - Chart
                    
                    CardView {
                        VStack {
                            ChartLabel("\(vm.accumulateTransactions().last?.1)" , type: .title)
                            LineChart()
                        }
                        .background(Color.colorTheme.systemBackground)
                        
                    }
                    .data(vm.accumulateTransactions())
                    .chartStyle(
                        ChartStyle(
                            backgroundColor: Color.colorTheme.background,
                            foregroundColor: ColorGradient(Color.colorTheme.icon.opacity(0.4), Color.colorTheme.icon)))
                    .frame(height: 300)
                    
                    
                    // MARK: - Transaction List
                    RecentTransactionList()
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                
            }
            .background(Color.colorTheme.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // MARK: - Notification Icon
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.hierarchical)
                        .foregroundColor(.colorTheme.icon)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}










struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(TransactionViewModel())
    }
}
