//
//  IncomeView.swift
//  ios-practice-dpo
//
//  Created by Антон Казеннов on 12.04.2023.
//

import SwiftUI

struct IncomeView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .easeOut)
    private var items: FetchedResults<Item>


    
    @State var currentBalance:Double = 0.rounded(.towardZero)
    @State private var showingSheet = false


    
    var body: some View {
        NavigationView {
            VStack() {
                HStack {
                    Text("Текущий баланс:")
                    Spacer()
                    Text("\(currentBalance.rounded(.towardZero))")
                    Image(systemName: "rublesign")

                }

                Spacer(minLength: 20)
                Text("Доходы")
                    .font(.largeTitle)
                    .bold()
                ScrollView {
                    Text("dfg")
                }
                
                VStack {
                    Button("Добавить доход") {
                        showingSheet.toggle()
                    }
                    .sheet(isPresented: $showingSheet) {
                                addButtonMain()
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
            
        }
        .navigationBarTitle("hello")
        .navigationTitle("hello")


    }

    func addNew() {
        
    }

}


struct IncomeView_Previews: PreviewProvider {
    static var previews: some View {
        IncomeView(currentBalance: 20)
    }
}
