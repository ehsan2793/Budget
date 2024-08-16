//
//  budgetApp.swift
//  budget
//
//  Created by Ehsan Rahimi on 8/15/24.
//

import SwiftUI

@main
struct budgetApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
