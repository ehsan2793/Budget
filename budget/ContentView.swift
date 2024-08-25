//
//  ContentView.swift
//  budget
//
//  Created by Ehsan Rahimi on 8/15/24.
//

import CoreData
import SwiftUI

struct ContentView: View {
    // MARK: - STATE PROPERTIES

    @State private var isPresented: Bool = false

    // MARK: - ENVIRONMENT PROPERTIES

    @FetchRequest(sortDescriptors: []) private var budgetCategoryResults: FetchedResults<BudgetCategory>
    @Environment(\.managedObjectContext) private var viewContext

    // MARK: - BODY

    var body: some View {
        NavigationStack {
            VStack {
                List(budgetCategoryResults) { budgetcategory in
                    Text(budgetcategory.title ?? "")
                }
            }
            .sheet(isPresented: $isPresented) {
                AddBudgetCategoryView()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Category") {
                        isPresented = true
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
