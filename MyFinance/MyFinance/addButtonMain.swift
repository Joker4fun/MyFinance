
//  addButtonMain.swift
//  MyFinance
//
//  Created by Антон Казеннов on 22.04.2023.
//

import SwiftUI

struct addButtonMain: View {
    
    @Environment(\.dismiss) var dissmis
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \BalanceEntiti.moneyCount, ascending: true)],
        animation: .easeOut)
    private var items: FetchedResults<BalanceEntiti>
    
    @State var value:String = ""
    @FocusState private var keyboardFocused: Bool
    @Binding var newBalanceEntiti:Double
    
    
    
    var body: some View {
        VStack(alignment: .center) {
           
            
            TextField("Сумма", text: $value)
                .keyboardType(.numberPad)
                .focused($keyboardFocused)
                .ignoresSafeArea(.keyboard)
                .padding([.leading, .trailing], 20)

                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() ) {
                        keyboardFocused = true
                    }
                }
                
            Divider()
            Button("Добавить доход") {
                addBalanceEntiti(num: Double(value) ?? 0)
                self.newBalanceEntiti = items.map({ $0.moneyCount }).reduce(0,+)

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
    private func addBalanceEntiti(num: Double) {
        withAnimation {
            let newBalanceEntiti = BalanceEntiti(context: viewContext)
            newBalanceEntiti.moneyCount = Double(num)
            newBalanceEntiti.createDate = Date.now
            
            do {
                try viewContext.save()
                print(newBalanceEntiti.moneyCount)
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

//struct addButtonMain_Previews: PreviewProvider {
//    static var previews: some View {
//        addButtonMain(newBalanceEntiti:items.map({ $0.balance }).reduce(0,+)
//)
//    }
//}
