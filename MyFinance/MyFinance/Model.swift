//
//  Model.swift
//  MyFinance
//
//  Created by Антон Казеннов on 02.05.2023.
//

import Foundation
import Combine
import SwiftUI
import CoreData


class MainViewModel: ObservableObject {
    
    
    static let shared = MainViewModel()

    @Published var savedItem:[Item] = []
    
    lazy var totalBalance: Double = {
        var summ:Double = 0.0
        for i in savedItem {
            summ += i.balance
        }
        totalBal = summ
        return summ
    }()
    
    @Published var totalBal:Double = 0

    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "MyFinance")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        fetchItem()
        print(totalBalance)
    }
    
    func fetchItem(){
        let request = NSFetchRequest<Item>(entityName: "Item")
        do {
            savedItem = try container.viewContext.fetch(request)
        } catch let error {
            print ("Error fetching. \(error)")
        }
    }
    
    
    func addItem(num: Double) {
        let item = Item(context: container.viewContext)
        item.balance = num
        saveData()
        print("\(item.balance)")
    }
    
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchItem()
        } catch let error {
            print("Error saving - \(error)")
        }
    }
    
}
