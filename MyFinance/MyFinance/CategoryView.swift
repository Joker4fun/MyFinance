//
//  ExpensesView.swift
//  ios-practice-dpo
//
//  Created by Антон Казеннов on 12.04.2023.
//

import SwiftUI

struct CategoryView: View {
    
    @State private var showingSheet = false
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(entity: Category.entity(), sortDescriptors: [])
    var categorys: FetchedResults<Category>
    
    
    var body: some View {
        
        NavigationView {
            VStack() {
                Text("Расходы")
                    .font(.largeTitle)
                    .bold()
                List {
                    ForEach(categorys) { name in
                        NavigationLink(name.unwrappedName, destination: DetailVC(itemsInCategory: name))
                        
                    }
                    .onDelete(perform: removeIncome(at:))
                }
                
                
                
                
                
                VStack {
                    Button("Добавить категорию расходов") {
                        showingSheet.toggle()
                    }
                    .sheet(isPresented: $showingSheet) {
                        addButtonExpenses()
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
        

        
    }
    func removeIncome(at offsets: IndexSet) {
        for index in offsets {
            let income = categorys[index]
            viewContext.delete(income)
        }
        do {
            try viewContext.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    
    
}



struct ExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
