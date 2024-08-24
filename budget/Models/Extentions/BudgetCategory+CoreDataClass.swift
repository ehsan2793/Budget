//
//  BudgetCategory+CoreDataClass.swift
//  budget
//
//  Created by Ehsan Rahimi on 8/15/24.
//

import CoreData
import Foundation

@objc(BudgetCategory)
public class BudgetCategory: NSManagedObject {
    override public func awakeFromInsert() {
        dateCreated = Date()
    }
}
