//
//  ContentView.swift
//  ios-practice-dpo
//
//  Created by Антон Казеннов on 12.04.2023.
//

import SwiftUI

struct TabbView: View {
    var body: some View {
        NavigationView {
            TabView {
                IncomeView(currentBalance: 20)
                    .tabItem {
                        Label("Доходы", systemImage: "dollarsign.circle")
                        
                    }
                
                ChartView()
                    .tabItem {
                        Label("График", systemImage: "chart.xyaxis.line")
                    }
                
                ExpensesView()
                    .tabItem {
                        Label("Расходы", systemImage: "circle.grid.3x3.circle")
                    }
                
            }
            
        }
    }
}

struct TabbView_Previews: PreviewProvider {
    static var previews: some View {
        TabbView()
    }
}
