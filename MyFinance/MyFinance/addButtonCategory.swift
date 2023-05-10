

import SwiftUI

struct addButtonExpenses: View {
    
    @Environment(\.dismiss) var dissmis
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var newCategory:String = ""
    @FocusState private var keyboardFocused: Bool
    
    
    
    var body: some View {
        VStack(alignment: .center) {
            
            
            TextField("Категория", text: $newCategory)
                .keyboardType(.alphabet)
                .focused($keyboardFocused)
                .ignoresSafeArea(.keyboard)
                .padding([.leading, .trailing], 20)
                
            
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() ) {
                        keyboardFocused = true
                    }
                }
            
            Divider()
            Button("Добавить категорию расходов") {
                addCategory(name: newCategory)
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
    private func addCategory(name: String) {
        withAnimation {
            if !name.isEmpty {
                let newCat = Category(context: viewContext)
                newCat.name = name
                try? viewContext.save()
            }

        }
    }
}


