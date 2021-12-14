//
//  ExpenseModel.swift
//  economic
//
//  Created by Goga Eusebiu on 14.12.2021.
//

import Foundation

struct ExpenseModel: Codable, Identifiable {
    var id: String
    var company: String
    var currency: String
    var totalAmount: Double
    var createdDate: Date
}
