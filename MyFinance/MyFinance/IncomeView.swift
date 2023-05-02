//
//  IncomeView.swift
//  ios-practice-dpo
//
//  Created by Антон Казеннов on 12.04.2023.
//

import SwiftUI

struct IncomeView: View {
    
    @StateObject var vm = MainViewModel()

    
    @State var currentBalance:Double = 0
    @State private var showingSheet = false
    
    
    var body: some View {
        
        NavigationView {
            VStack() {
                HStack {
                    Text("Текущий баланс:")
                    Spacer()
                    Text("\(vm.totalBal)")
                    Image(systemName: "rublesign")
                    
                }
                
                Spacer(minLength: 20)
                Text("Доходы")
                    .font(.largeTitle)
                    .bold()
                ScrollView {
                    List {
                        ForEach(vm.savedItem) { money in
                            Text("hello")
                           // print(money.balance)
                        }
                    }
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
                    currentBalance = vm.totalBal
                }
                .onChange(of: vm.totalBal, perform: { newValue in
                    currentBalance = vm.totalBal
                })
                .navigationBarTitle("hello")
                .navigationTitle("hello")
                
                
            }
            
        }
        
        
        struct IncomeView_Previews: PreviewProvider {
            static var previews: some View {
                IncomeView(currentBalance: 0)
            }
        }
