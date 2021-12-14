//
//  ExpenseCellView.swift
//  economic
//
//  Created by Goga Eusebiu on 14.12.2021.
//

import SwiftUI

struct ExpenseCellView: View {
    var expense: ExpenseModel
    
    private func expenseCreatedDateString() -> String {
        return AppDateFormatter.sharedManager.stringFromDate(date: expense.createdDate)
    }
    
    var body: some View {
        VStack() {
            HStack {
                Text(self.expenseCreatedDateString()).font(.system(size: 12)).padding(.all)
            }
            
            HStack {
                Text(String(format: "%.2f", expense.totalAmount)).font(.largeTitle).padding(.all)
                Spacer()
                Text(expense.currency).font(.largeTitle).padding(.all)
            }
            
            HStack {
                Text(expense.company).font(.system(size: 12).bold()).padding(.all)
                Spacer()
            }
        }.background(Color(.systemGray5))
    }
}
