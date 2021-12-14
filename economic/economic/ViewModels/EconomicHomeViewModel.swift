//
//  EconomicHomeViewModel.swift
//  economic
//
//  Created by Goga Eusebiu on 14.12.2021.
//

import Combine

final class EconomicHomeViewModel: ObservableObject {
    @Published var expenseRepository = ExpenseRepository()
    @Published var expenses: [ExpenseModel] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        expenseRepository.$expenses.assign(to: \.expenses, on: self)
            .store(in: &cancellables)
    }
}

