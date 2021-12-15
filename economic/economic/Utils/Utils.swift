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
    
    static let expenseCurencies = ["EUR", "USD", "RON"]
}
