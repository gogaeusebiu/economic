//
//  CreateExpenseView.swift
//  economic
//
//  Created by Goga Eusebiu on 14.12.2021.
//

import SwiftUI

struct CreateExpenseView: View {
    @ObservedObject var createExpenseViewModel: CreateExpenseViewModel

    var didAddExpense: () -> Void

    var body: some View {
        NavigationView {
            VStack {
                Text("Create Expense").font(.largeTitle)
                Spacer()
                VStack(spacing:5) {
                    TextField("Company name", text: $createExpenseViewModel.expenseCompanyName)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5)
                        .shadow(radius: 2)

                    
                    Text(createExpenseViewModel.inlineErrorForCompanyName)
                        .foregroundColor(.red)
                        .font(.system(size: 12))
                }.padding()
                Spacer()
                VStack(spacing:5) {
                    TextField("Total amount", text: $createExpenseViewModel.expenseTotalAmount)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5)
                        .shadow(radius: 2)

                    
                    Text(createExpenseViewModel.inlineErrorForTotalAmount)
                        .foregroundColor(.red)
                        .font(.system(size: 12))
                }.padding()
                Spacer()
                VStack(spacing: 5) {
                    DropdownView(dropdownTitle: "Choose currency", optionList: Utils.expenseCurencies, selectedOption: $createExpenseViewModel.currencySelected)
                    .padding()
                    
                    Text(createExpenseViewModel.inlineErrorForCurrency)
                        .foregroundColor(.red)
                        .font(.system(size: 12))
                }
                Spacer()
                Button {
                    createExpenseViewModel.addExpense()
                    didAddExpense()
                } label: {
                    Text("Create Deposit")
                        .frame(width: 250, height: 50, alignment: .center)
                        .font(.title2)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }.padding()
                .disabled(!createExpenseViewModel.isValid)
                .shadow(radius: 2)
            }
        }
    }
}
