//
//  Expens+CoreDataProperties.swift
//  MyFinance
//
//  Created by Антон Казеннов on 07.05.2023.
//
//

import Foundation
import CoreData


extension Expens {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expens> {
        return NSFetchRequest<Expens>(entityName: "Expens")
    }

    @NSManaged public var name: String
    @NSManaged public var time: Date?
    @NSManaged public var count: Double
    @NSManaged public var allmoney: Double
    @NSManaged public var toCategory: Category?
    

}

extension Expens : Identifiable {
    

}
