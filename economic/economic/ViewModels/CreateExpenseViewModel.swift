//
//  CreateExpenseViewModel.swift
//  economic
//
//  Created by Goga Eusebiu on 14.12.2021.
//

import Combine

final class CreateExpenseViewModel: ObservableObject {
    @Published var expenseRepository = ExpenseRepository()
    
    func addExpense() {
        expenseRepository.addExpense()
    }
}
