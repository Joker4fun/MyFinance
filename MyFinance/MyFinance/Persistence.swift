////
////  Persistence.swift
////  MyFinance
////
////  Created by Антон Казеннов on 18.04.2023.
////
//
//import CoreData
//
//struct PersistenceController {
//    static let shared = PersistenceController()
//    
//    var viewContext: NSManagedObjectContext {
//        return container.viewContext
//    }
//    
//    let container: NSPersistentContainer
//    
//    init() {
//        container = NSPersistentContainer(name: "MyFinance")
//        container.viewContext.automaticallyMergesChangesFromParent = true
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//    }
//    
//}
