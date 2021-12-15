//
//  DropdownView.swift
//  economic
//
//  Created by Goga Eusebiu on 15.12.2021.
//

import SwiftUI

struct DropdownView<T: StringProtocol>: View {
    var dropdownTitle = ""
    var optionList: [T]
    
    @Binding var selectedOption: T
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(dropdownTitle)
                .font(.title3)
            DisclosureGroup(selectedOption, isExpanded: $isExpanded) {
                VStack {
                    ForEach(optionList, id: \.self) { option in
                        Text(option)
                            .font(.system(size: 18))
                            .padding(.all)
                            .onTapGesture {
                                self.selectedOption = option
                                withAnimation {
                                    self.isExpanded.toggle()
                                }
                            }
                    }
                }
            }.accentColor(.white)
            .foregroundColor(.white)
            .font(.title2)
            .padding(.all)
            .background(Color.purple)
            .cornerRadius(5)
            .shadow(radius: 2)

        }
    }
}
