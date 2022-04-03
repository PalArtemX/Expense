//
//  HomeView.swift
//  Expense
//
//  Created by Artem Paliutin on 03/04/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // MARK: - Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
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
    }
}
