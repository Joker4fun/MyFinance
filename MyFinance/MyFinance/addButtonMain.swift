
//  addButtonMain.swift
//  MyFinance
//
//  Created by Антон Казеннов on 22.04.2023.
//

import SwiftUI

struct addButtonMain: View {
    
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.balance, ascending: true)],
        animation: .easeOut)
    private var items: FetchedResults<Item>
    
    @State var value:String = ""
    @FocusState private var keyboardFocused: Bool
    
    
    
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
                let item = Item(context: viewContext)
                item.balance += Double(value) ?? 0
                do {
                    try viewContext.save()
                } catch {
                    print(error.localizedDescription)
                }
                print(item.balance)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            .background(.blue)
            .cornerRadius(50)
            .tint(.white)
            .buttonStyle(.automatic)
            .padding([.leading, .trailing], 20)

            
            
        }
    }
}

struct addButtonMain_Previews: PreviewProvider {
    static var previews: some View {
        addButtonMain()
    }
}
