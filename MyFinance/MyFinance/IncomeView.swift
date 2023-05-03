//
//  IncomeView.swift
//  ios-practice-dpo
//
//  Created by Антон Казеннов on 12.04.2023.
//

import SwiftUI

struct IncomeView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \BalanceEntiti.balance, ascending: false)],
//        animation: .easeOut)
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\BalanceEntiti.createDate, order: .reverse)])
   
  
    private var items: FetchedResults<BalanceEntiti>


    
    @State var currentBalanceEntiti:Double
    @State private var showingSheet = false


    
    var body: some View {
        NavigationView {
            VStack() {
                HStack {
                    Text("Текущий баланс:")
                    Spacer()
                    Text("\(currentBalanceEntiti.rounded(.towardZero))")
                    Image(systemName: "rublesign")

                }

                Spacer(minLength: 20)
                Text("Доходы")
                    .font(.largeTitle)
                    .bold()
        
                    
                    List(items) { expen in
                        Text(String(expen.moneyCount))
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
            currentBalanceEntiti = items.map({ $0.moneyCount }).reduce(0,+)
            
        }

        .navigationBarTitle("hello")
        .navigationTitle("hello")


    }

    func addNew() {
        
    }

}


struct IncomeView_Previews: PreviewProvider {
    @Environment(\.managedObjectContext) private var viewContext
    static var previews: some View {
        IncomeView(currentBalanceEntiti: 20)
    }
}
