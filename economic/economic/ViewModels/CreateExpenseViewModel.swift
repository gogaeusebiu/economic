//
//  CreateExpenseViewModel.swift
//  economic
//
//  Created by Goga Eusebiu on 14.12.2021.
//

import Combine
import Foundation

final class CreateExpenseViewModel: ObservableObject {
    @Published var expenseRepository = ExpenseRepository()
    @Published var expenses: [ExpenseEntity] = []

    @Published var expenseCompanyName = ""
    @Published var expenseTotalAmount = ""
    @Published var currencySelected = ""
    
    @Published var inlineErrorForCompanyName = ""
    @Published var inlineErrorForTotalAmount = ""
    @Published var inlineErrorForCurrency = ""
    
    @Published var isValid = false
    
    private var cancellables: Set<AnyCancellable> = []

    private var isCompanyNameEmptyPublisher: AnyPublisher<Bool, Never> {
        $expenseCompanyName.debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { $0.isEmpty }
            .eraseToAnyPublisher()
    }
    
    private var isCurrencyEmptyPublisher: AnyPublisher<Bool, Never> {
        $currencySelected.debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { $0.isEmpty }
            .eraseToAnyPublisher()
    }
    
    private var isDepositAmountEmptyPublisher: AnyPublisher<Bool, Never> {
        $expenseTotalAmount.debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { $0.isEmpty }
            .eraseToAnyPublisher()
    }
    
    private var isDepositAmountValidNumberPublisher: AnyPublisher<Bool, Never> {
        $expenseTotalAmount.debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { Utils.numberPredicate.evaluate(with: $0) }
            .eraseToAnyPublisher()
    }
    
    private var isAmountValidPublisher: AnyPublisher<TotalAmountStatus, Never> {
        Publishers.CombineLatest(isDepositAmountEmptyPublisher, isDepositAmountValidNumberPublisher)
            .map {
                if $0 { return TotalAmountStatus.totalAmountEmpty }
                if !$1 { return TotalAmountStatus.totalAmountIsNotANumber }
                return TotalAmountStatus.valid
            }
            .eraseToAnyPublisher()
    }
    
    private var isReadyToBeCreatedPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest3(isCompanyNameEmptyPublisher, isAmountValidPublisher, isCurrencyEmptyPublisher)
            .map { !$0 && ($1 == .valid) && !$2 }
            .eraseToAnyPublisher()
    }
    
    init() {
        expenseRepository.$expenses.assign(to: \.expenses, on: self)
            .store(in: &cancellables)
        
        isCompanyNameEmptyPublisher
            .receive(on: RunLoop.main)
            .map {
                if $0 {
                    return "Please add company name"
                }
                return ""
            }
            .assign(to: \.inlineErrorForCompanyName, on: self)
            .store(in: &cancellables)
        
        isCurrencyEmptyPublisher
            .receive(on: RunLoop.main)
            .map {
                if $0 {
                    return "Please select currency"
                }
                return ""
            }
            .assign(to: \.inlineErrorForCurrency, on: self)
            .store(in: &cancellables)
        
        isAmountValidPublisher
            .dropFirst()
            .receive(on: RunLoop.main)
            .map { totalAmountStatus in
                switch totalAmountStatus {
                case .totalAmountEmpty:
                    return "Amount must contain a value"
                case .totalAmountIsNotANumber:
                    return "Amount is not a valid number"
                case .valid:
                    return ""
                }
            }
            .assign(to: \.inlineErrorForTotalAmount, on: self)
            .store(in: &cancellables)
        
        isReadyToBeCreatedPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
            .store(in: &cancellables)
    }
    
    func addExpense() {
        expenseRepository.addExpense(expenseCompanyName, Double(expenseTotalAmount)!, currencySelected)
    }
}
