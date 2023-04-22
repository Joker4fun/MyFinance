//
//  IncomeView.swift
//  ios-practice-dpo
//
//  Created by Антон Казеннов on 12.04.2023.
//

import SwiftUI

struct IncomeView: View {
    
    @State var currentBalance:Int = 20
    
    var body: some View {
        NavigationView {
            VStack() {
                HStack {
                    Text("Текущий баланс:")
                    Spacer()
                    Text("\(currentBalance)")
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
                        addNew()
                    }
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
