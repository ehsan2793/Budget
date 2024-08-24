//
//  coreDataManager.swift
//  budget
//
//  Created by Ehsan Rahimi on 8/23/24.
//

import CoreData
import Foundation

class CoreDataManager {
    static let shared = CoreDataManager()
    private let persistentContainer: NSPersistentContainer
    private init() {
        persistentContainer = NSPersistentContainer(name: "BudgetModel")
        persistentContainer.loadPersistentStores { _, error in
            if let error {
                fatalError("Unable to iniialize Core Data stack \(error)")
            }
        }
    }

    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
}
