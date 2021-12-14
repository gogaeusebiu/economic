//
//  economicApp.swift
//  economic
//
//  Created by Goga Eusebiu on 14.12.2021.
//

import SwiftUI

@main
struct economicApp: App {
    var body: some Scene {
        WindowGroup {
            EconomicHomeView(economicHomeViewModel: EconomicHomeViewModel())
        }
    }
}
