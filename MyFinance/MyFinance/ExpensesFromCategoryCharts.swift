//
//  ExpensesFromCategoryCharts.swift
//  MyFinance
//
//  Created by Антон Казеннов on 11.05.2023.
//

import SwiftUI
import Charts
import CoreData

enum PeriodForExpensCategory: CaseIterable, Identifiable, CustomStringConvertible {
    case week
    case month
    case quarter
    case alltime
    
    
    var id: Self { self }
    
    var description: String {
        
        switch self {
        case .week:
            return "Неделя"
        case .month:
            return "Месяц"
        case .quarter:
            return "Квартал"
        case .alltime:
            return "Все время"
        }
    }
}

struct ExpensesFromCategoryCharts: View {
    
    @StateObject var expenFromCat:Category
    @State private var expenPeriod: PeriodForExpensCategory = .week
    
    
    
    var body: some View {
        VStack {
            Picker("timePiriod", selection: $expenPeriod) {
                ForEach(PeriodForExpensCategory.allCases, id: \.self) { option in
                    Text(option.description)
                }
            }
            .padding(.all, 5)
            .pickerStyle(.segmented)
            Chart{
                switch expenPeriod {
                case .week:
                    ForEach(expenFromCat.toExpensArray){ item in
                        LineMark(
                            x: .value("Week", item.time, unit: .weekday),
                            y: .value("Count", item.count),
                            series: .value("Income", "A")
                        )
                        .foregroundStyle(.green)
                        
                    }
                    
                    
                    
                case .month:
                    ForEach(expenFromCat.toExpensArray){ item in
                        LineMark(
                           x: .value("Month", item.time, unit: .month),
                           y: .value("Hours of Sunshine", item.count),
                           series: .value("Income", "A")
                        )
                        .foregroundStyle(.green)
                        
                    }
                    
                case .quarter:
                    ForEach(expenFromCat.toExpensArray){ item in
                        LineMark(
                            x: .value("Month", item.time, unit: .quarter),
                            y: .value("Hours of Sunshine", item.count),
                            series: .value("Income", "A")
                        )
                        .foregroundStyle(.green)
                        
                    }
                    
                case .alltime:
                    ForEach(expenFromCat.toExpensArray){ item in
                        LineMark(
                            x: .value("Month", item.time),
                            y: .value("Hours of Sunshine", item.count),
                            series: .value("Income", "A")
                        )
                        .foregroundStyle(.green)
                        
                    }
                }
                
            }
            
            .padding(.all, 5)
            
            
        }
        
        
        
    }
}
    
