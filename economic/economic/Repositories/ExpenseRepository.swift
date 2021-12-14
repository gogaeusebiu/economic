//
//  ExpenseRepository.swift
//  economic
//
//  Created by Goga Eusebiu on 14.12.2021.
//

import Combine

final class ExpenseRepository: ObservableObject {
    @Published var expenses: [ExpenseModel] = Utils.expensesDummyData
    
    init() {
        
    }
    
    func addExpense() {
        
    }
}
