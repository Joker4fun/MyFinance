//
//  Category+CoreDataProperties.swift
//  MyFinance
//
//  Created by Антон Казеннов on 07.05.2023.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var name: String?
    @NSManaged public var toExpens: NSSet?
    
    public var unwrappedName: String {
        name ?? "Unknown name"
    }

    public var toExpensArray: [Expens] {
        let toExpensSet = toExpens as? Set<Expens> ?? []
        
        return toExpensSet.sorted {
            $0.name < $1.name
        }
    }

}

// MARK: Generated accessors for toExpens
extension Category {

    @objc(addToExpensObject:)
    @NSManaged public func addToToExpens(_ value: Expens)

    @objc(removeToExpensObject:)
    @NSManaged public func removeFromToExpens(_ value: Expens)

    @objc(addToExpens:)
    @NSManaged public func addToToExpens(_ values: NSSet)

    @objc(removeToExpens:)
    @NSManaged public func removeFromToExpens(_ values: NSSet)
    
    
   

}

extension Category : Identifiable {

}
