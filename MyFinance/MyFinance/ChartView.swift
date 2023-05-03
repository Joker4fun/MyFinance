//
//  ChartView.swift
//  ios-practice-dpo
//
//  Created by Антон Казеннов on 12.04.2023.
//

import SwiftUI
import Charts
import CoreData




struct ChartView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \BalanceEntiti.createDate, ascending: true)],
        animation: .easeOut)
    private var items: FetchedResults<BalanceEntiti>
    
    
    @State private var period = "Неделя"
    var timePeriod = ["Неделя", "Месяц", "Квартал", "Все время"]
    
    var body: some View {
        
//        var expensesByDay: [(date: Date, amount: Double)] {
//            let fetchRequest: NSFetchRequest<BalanceEntiti> = BalanceEntiti.fetchRequest()
//            let sortDescriptor = NSSortDescriptor(keyPath: \BalanceEntiti.createDate, ascending: true)
//            fetchRequest.sortDescriptors = [sortDescriptor]
//
//            let expenses = try? viewContext.fetch(fetchRequest)
//            let groupedExpenses = Dictionary(grouping: expenses ?? [], by: { $0.createDate })
//
//            return groupedExpenses.map { (key, value) in
//                let totalAmount = value.map({ $0.moneyCount }).reduce(0,+)
//                print(totalAmount)
//
//
//                return (date: key!, amount: totalAmount)
//            }
//        }
        VStack {
            Picker("timePiriod", selection: $period) {
                ForEach(timePeriod, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            Chart(items) {
                LineMark(
                    x: .value("Month", $0.createDate!),
                    y: .value("Hours of Sunshine", $0.moneyCount)
                )
            
            }
        }
 

        
    }
    
    
}
    
    struct ChartView_Previews: PreviewProvider {
        static var previews: some View {
            ChartView()
        }
    }
