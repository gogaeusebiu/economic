//
//  EconomicHomeViewModel.swift
//  economic
//
//  Created by Goga Eusebiu on 14.12.2021.
//

import Combine
import Foundation

final class EconomicHomeViewModel: ObservableObject {
    @Published var expenseRepository = ExpenseRepository()
    @Published var expenses: [ExpenseEntity] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        expenseRepository.$expenses.assign(to: \.expenses, on: self)
            .store(in: &cancellables)
    }
    
    func removeExpense(with indexSet: IndexSet) {
        guard let expenseIndex = indexSet.first else { return }
        
        expenseRepository.removeExpense(expenses[expenseIndex])
    }
}

