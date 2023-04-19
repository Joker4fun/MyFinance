//
//  MyFinanceApp.swift
//  MyFinance
//
//  Created by Антон Казеннов on 18.04.2023.
//

import SwiftUI

@main
struct MyFinanceApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
