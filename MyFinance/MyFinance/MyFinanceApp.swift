//
//  MyFinanceApp.swift
//  MyFinance
//
//  Created by Антон Казеннов on 18.04.2023.
//

import SwiftUI

@main
struct MyFinanceApp: App {
    let persistenceController = PersistenceController.shared.container.viewContext

    var body: some Scene {
        WindowGroup {
            TabbView()
                .environment(\.managedObjectContext, persistenceController)
        }
    }
}
