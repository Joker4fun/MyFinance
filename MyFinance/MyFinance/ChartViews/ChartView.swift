//
//  ChartView.swift
//  ios-practice-dpo
//
//  Created by Антон Казеннов on 12.04.2023.
//

import SwiftUI
import Charts
import CoreData



enum Period: CaseIterable, Identifiable, CustomStringConvertible {
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

struct ChartView: View {

    @Environment(\.managedObjectContext) private var viewContext
  
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \BalanceEntiti.createDate, ascending: true)],
        animation: .easeOut)
    private var items: FetchedResults<BalanceEntiti>
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Expens.time, ascending: true)],
        animation: .easeOut)
    private var expenItems: FetchedResults<Expens>
    
    @State private var period: Period = .week
    var body: some View{
        
        VStack {
            Picker("timePiriod", selection: $period) {
                ForEach(Period.allCases, id: \.self) { option in
                    Text(option.description)
                }
            }
            .padding(.all, 5)
            .pickerStyle(.segmented)
            Chart{
                switch period {
                case .week:
                    ForEach(items, id: \.createDate){
                        LineMark(
                          x: .value("Week", $0.createDate ?? Date.now, unit: .weekday),
                            y: .value("Count", $0.moneyCount),
                            series: .value("Income", "A")
                        )
                        .foregroundStyle(.green)
                    }
                    
                    ForEach(expenItems, id: \.time){
                        LineMark(
                          x: .value("Week", $0.time ?? Date.now, unit: .weekday),
                            y: .value("Count", $0.count)
                        )
                        .foregroundStyle(.red)
                    }
                    
                case .month:
                    ForEach(items){
                        LineMark(
                            x: .value("Month", $0.createDate ?? Date.now, unit: .month),
                            y: .value("Count", $0.moneyCount),
                            series: .value("Income", "A")
                        )
                        .foregroundStyle(.green)

                    }
                    ForEach(expenItems){
                        LineMark(
                            x: .value("Month", $0.time ?? Date.now, unit: .month),
                            y: .value("Count", $0.count)
                        )
                        .foregroundStyle(.red)
                    }
                case .quarter:
                    ForEach(items){
                        LineMark(
                            x: .value("Quarter", $0.createDate ?? Date.now, unit: .quarter),
                            y: .value("Count", $0.moneyCount),
                            series: .value("Income", "A")
                        )
                        .foregroundStyle(.green)
                    }
                    ForEach(expenItems){
                        LineMark(
                            x: .value("Quarter", $0.time ?? Date.now, unit: .quarter),
                            y: .value("Count", $0.count)
                        )
                        .foregroundStyle(.red)
                    }
                case .alltime:
                    ForEach(items){
                        LineMark(
                            x: .value("All time", $0.createDate ?? Date.now),
                            y: .value("Count", $0.moneyCount),
                            series: .value("Income", "A")
                        )
                        .foregroundStyle(.green)
                    }
                    ForEach(expenItems){
                        LineMark(
                            x: .value("All time", $0.time ?? Date.now),
                            y: .value("Count", $0.count)
                        )
                        .foregroundStyle(.red)
                    }
                }
            }
            .chartForegroundStyleScale(["Доходы": .green, "Расходы": .red])
                    .padding(.all, 5)
            }
        }
    }

