//
//  AddBudgetCategoryView.swift
//  budget
//
//  Created by Ehsan Rahimi on 8/24/24.
//

import SwiftUI

struct AddBudgetCategoryView: View {
    @State private var title: String = ""
    @State private var total: Double = 0
    @State private var messages: [String] = []

    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss

    // MARK: - COMPUTED PROPERTIES

    var isFormValid: Bool {
        messages.removeAll()
        if title.isEmpty {
            messages.append("Title is required")
        }
        if total <= 0 {
            messages.append("Total should be greater than 1")
        }

        return messages.isEmpty
    }

    // MARK: - FUNCTIONS

    private func save() {
        let budgetCategory = BudgetCategory(context: viewContext)
        budgetCategory.title = title
        budgetCategory.total = total
        do {
            try viewContext.save()
            dismiss()
        } catch {
            print(error.localizedDescription)
        }
    }

    // MARK: - BODY

    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                Slider(value: $total, in: 0 ... 500, step: 1) {
                    Text("Total")
                } minimumValueLabel: {
                    Text("$0")
                } maximumValueLabel: {
                    Text("$500")
                }
                Text(total as NSNumber, formatter: NumberFormatter.currency)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .center)

                ForEach(messages, id: \.self) { message in
                    Text(message)
                }
            } //: FORM
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundStyle(.red)
                    .fontWeight(.bold)
                } //: ITEM

                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        if isFormValid {
                            save()
                        }
                    }
                    .fontWeight(.bold)
                } //: ITEM
            }
        }
    }
}

#Preview {
    AddBudgetCategoryView()
}
