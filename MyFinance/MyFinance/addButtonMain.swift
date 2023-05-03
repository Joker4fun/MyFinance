
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
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.balance, ascending: true)],
        animation: .easeOut)
    private var items: FetchedResults<Item>
    
    @State var value:String = ""
    @FocusState private var keyboardFocused: Bool
    @Binding var newBalance:Double
    
    
    
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
                addItem(num: Double(value) ?? 0)
                self.newBalance = items.map({ $0.balance }).reduce(0,+)

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
    private func addItem(num: Double) {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.balance = Double(num)
            newItem.time = Date.now
            
            do {
                try viewContext.save()
                print(newItem.balance)
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

//struct addButtonMain_Previews: PreviewProvider {
//    static var previews: some View {
//        addButtonMain(newBalance:items.map({ $0.balance }).reduce(0,+)
//)
//    }
//}
