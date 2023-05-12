//
//  IncomeView.swift
//  ios-practice-dpo
//
//  Created by Антон Казеннов on 12.04.2023.
//

import SwiftUI

struct IncomeView: View {
  
  @Environment(\.managedObjectContext) private var viewContext
  
  @FetchRequest(sortDescriptors: [SortDescriptor(\BalanceEntiti.createDate, order: .reverse)])
  private var items: FetchedResults<BalanceEntiti>
  
  @FetchRequest(sortDescriptors: [SortDescriptor(\Expens.count, order: .reverse)])
  private var expens: FetchedResults<Expens>
  
  @State var currentBalanceEntiti:Double
  @State private var showingSheet = false
  
  var body: some View {
    NavigationView {
      VStack() {
        HStack {
          Text("Текущий баланс:")
            .padding(.leading)
          Spacer()
          Text(String(format: "%.02f", currentBalanceEntiti))
          Image(systemName: "rublesign")
            .padding(.trailing)
        }
        
        Spacer(minLength: 20)
        
        Text("Доходы")
          .font(.largeTitle)
          .bold()
        
        List{
          ForEach(items) { expen in
            Text(String(expen.moneyCount))
          }
          .onDelete(perform: removeIncome(at:))
        }
        
        VStack {
          Button("Добавить доход") {
            showingSheet.toggle()
          }
          .sheet(isPresented: $showingSheet) {
            addButtonMain(newBalanceEntiti: $currentBalanceEntiti)
              .presentationDetents([.height(100)])
          }
          .keyboardType(.numberPad)
          .frame(maxWidth: .infinity)
          .padding(.vertical)
          .background(.blue)
          .cornerRadius(50)
          .tint(.white)
        }
        .padding()
        .frame(alignment: .bottom)
      }
    }
    .onAppear {
      try? viewContext.save()
      currentBalanceEntiti = (items.map({ $0.moneyCount }).reduce(0,+)) - (expens.map({ $0.count }).reduce(0,+))
    }
  }
  
  func removeIncome(at offsets: IndexSet) {
    for index in offsets {
      let income = items[index]
      viewContext.delete(income)
    }
    do {
      try viewContext.save()
    } catch let error {
      print(error.localizedDescription)
    }
    currentBalanceEntiti = items.map({ $0.moneyCount }).reduce(0,+)
  }
  
}
