

import SwiftUI

struct expensesButton: View {
  
  @Environment(\.dismiss) var dissmis
  @Environment(\.managedObjectContext) private var viewContext
  
  @State var newExpenName:String = ""
  @State var newExpenCount:String = ""
  
  @FocusState private var keyboardFocused: Bool
  @StateObject var categoryToExpen: Category
  
  var body: some View {
    VStack(alignment: .center) {
      TextField("Наименование", text: $newExpenName)
        .keyboardType(.default)
        .disableAutocorrection(true)
        .focused($keyboardFocused)
        .ignoresSafeArea(.keyboard)
        .padding([.leading, .trailing], 20)
      
      Divider()
      
      TextField("Сумма", text: $newExpenCount)
        .keyboardType(.decimalPad)
        .focused($keyboardFocused)
        .ignoresSafeArea(.keyboard)
        .padding([.leading, .trailing], 20)
        .onAppear {
          DispatchQueue.main.asyncAfter(deadline: .now() ) {
            keyboardFocused = true
          }
        }
      
      Divider()
      
      Button("Добавить расход") {
        addExpenses(name: newExpenName, count: Double(newExpenCount) ?? 0)
        dissmis.callAsFunction()
      }
      .frame(maxWidth: .infinity)
      .padding(.vertical)
      .background(.blue)
      .cornerRadius(50)
      .tint(.white)
      .padding([.leading, .trailing], 20)
    }
  }
  
  private func addExpenses(name: String, count: Double) {
    if !name.isEmpty {
      let newExpen = Expens(context: viewContext)
      newExpen.name = name
      newExpen.count = count
      newExpen.time = Date.now
      categoryToExpen.addToToExpens(newExpen)
      try? viewContext.save()
    }
  }
}


