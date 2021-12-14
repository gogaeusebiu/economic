//
//  Utils.swift
//  economic
//
//  Created by Goga Eusebiu on 14.12.2021.
//

import Foundation

enum TotalAmountStatus {
    case totalAmountEmpty
    case totalAmountIsNotANumber
    case valid
}

class Utils {
    static let numberPredicate = NSPredicate(format: "SELF MATCHES %@", "^[0-9]+\\.?[0-9]*$")
    
    static let expensesDummyData: [ExpenseModel] = [
        ExpenseModel(id: "1", company: "Auto World", currency: "EUR", totalAmount: 20, createdDate: Date()),
        ExpenseModel(id: "2", company: "Auto World", currency: "USD", totalAmount: 30, createdDate: Date()),
        ExpenseModel(id: "3", company: "Auto World", currency: "RON", totalAmount: 100, createdDate: Date()),
        ExpenseModel(id: "4", company: "Auto World", currency: "EUR", totalAmount: 25, createdDate: Date())
    ]
}
