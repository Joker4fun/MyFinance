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

    @Published var savedBalanceEntiti:[BalanceEntiti] = []
    
    lazy var totalBalanceEntiti: Double = {
        var summ:Double = 0.0
        for i in savedBalanceEntiti {
            summ += i.moneyCount
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
        fetchBalanceEntiti()
        print(totalBalanceEntiti)
    }
    
    func fetchBalanceEntiti(){
        let request = NSFetchRequest<BalanceEntiti>(entityName: "BalanceEntiti")
        do {
            savedBalanceEntiti = try container.viewContext.fetch(request)
        } catch let error {
            print ("Error fetching. \(error)")
        }
    }
    
    
    func addBalanceEntiti(num: Double) {
        let item = BalanceEntiti(context: container.viewContext)
        item.moneyCount = num
        saveData()
        print("\(item.moneyCount)")
    }
    
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchBalanceEntiti()
        } catch let error {
            print("Error saving - \(error)")
        }
    }
    
}
