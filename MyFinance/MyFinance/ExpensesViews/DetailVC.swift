//
//  DetailVC.swift
//  MyFinance
//
//  Created by Антон Казеннов on 08.05.2023.
//

import SwiftUI

struct DetailVC: View {
  
  @State private var showingSheet = false
  @Environment(\.managedObjectContext) var viewContext
  @FetchRequest(entity: Expens.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Expens.time, ascending: true)])
  var expenses: FetchedResults<Expens>
  
  @StateObject var itemsInCategory: Category
  
  var body: some View {
    VStack {
      Divider()
      NavigationLink("График платежей"){
        ExpensesFromCategoryCharts(expenFromCat: itemsInCategory)
      }
      .frame(maxWidth: .infinity)
      .padding(.vertical)
      .background(.blue)
      .cornerRadius(50)
      .tint(.white)
      .padding([.leading, .trailing], 20)
      
      Divider()
      
      List {
        ForEach (itemsInCategory.toExpensArray) { expen in
          ListCellForExpensView(item: expen)
        }
        .onDelete(perform: removeExpen(at:))
      }
      
      Button("+") {
        showingSheet.toggle()
      }
      .sheet(isPresented: $showingSheet) {
        expensesButton(categoryToExpen: itemsInCategory)
          .presentationDetents([.height(120)])
      }
      .frame(width: 50, height: 50, alignment: .center)
      .background(.blue)
      .cornerRadius(50)
      .tint(.white)
    }
  }
  
  func removeExpen(at offsets: IndexSet) {
    for index in offsets {
      let income = expenses[index]
      viewContext.delete(income)
    }
    do {
      try viewContext.save()
    } catch let error {
      print(error.localizedDescription)
    }
  }
}
