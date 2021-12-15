//
//  ExpenseRepository.swift
//  economic
//
//  Created by Goga Eusebiu on 14.12.2021.
//

import Combine
import CoreData
import Foundation

final class ExpenseRepository: ObservableObject {
    @Published var expenses: [ExpenseEntity] = []

    private let container: NSPersistentContainer
    private let containerName = "EconomicContainer"
    private let entityName = "ExpenseEntity"

    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { (_, error) in
            if let error = error {
                print("Error loading core data \(error)")
            }
            
            self.getExpenses()
        }
    }
    
    // MARK: Public Methods
    
    func addExpense(_ company: String, _ totalAmount: Double, _ currency: String) {
        let expense = ExpenseEntity(context: container.viewContext)
        expense.company = company
        expense.totalAmount = totalAmount
        expense.currency = currency
        expense.createdDate = Date()
        
        applyChanges()
    }
    
    func removeExpense(_ expense: ExpenseEntity) {
        container.viewContext.delete(expense)
        applyChanges()
    }
    
    
    // MARK: Private Methods
    
    private func getExpenses() {
        let request = NSFetchRequest<ExpenseEntity>(entityName: entityName)
        
        do {
            expenses = try self.container.viewContext.fetch(request)
        } catch let error {
            print("Error executing fetch request \(error)")
        }
    }
    
    private func save() {
        do {
            try self.container.viewContext.save()
        } catch let error {
            print("Error saving to Core Data \(error)")
        }
    }
    
    private func applyChanges() {
        save()
        getExpenses()
    }
}
