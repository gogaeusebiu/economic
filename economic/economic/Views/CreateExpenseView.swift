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
                Button {
                    createExpenseViewModel.addExpense("Delta", 2, "EUR")
                    didAddExpense()
                } label: {
                    Text("Create Deposit")
                        .frame(width: 250, height: 50, alignment: .center)
                        .font(.title2)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }.padding()
                .shadow(radius: 2)
            }
        }
    }
}
