//
//  EconomicHomeView.swift
//  economic
//
//  Created by Goga Eusebiu on 14.12.2021.
//

import SwiftUI

struct EconomicHomeView: View {
    @ObservedObject var economicHomeViewModel: EconomicHomeViewModel
    
    @State private var showingForm = false
    @State var isNavigationBarHidden: Bool = true

    var body: some View {
        NavigationView {
            ZStack {
                List(economicHomeViewModel.expenses) { expense in
                    ExpenseCellView(expense: expense)
                        .cornerRadius(5)
                        .shadow(radius: 5)
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Button(action: {
                            showingForm = true
                        }) {
                            Circle()
                                .fill(Color.green)
                                .frame(height: 60)
                                .overlay(Image(systemName: "plus").foregroundColor(.white))
                                .shadow(radius: 5)
                        }.sheet(isPresented: $showingForm) {
                            CreateExpenseView(createExpenseViewModel: CreateExpenseViewModel()) {
                                showingForm = false
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
            }
        }
    }
}
