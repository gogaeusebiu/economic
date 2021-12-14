//
//  ConversionUtils.swift
//  economic
//
//  Created by Goga Eusebiu on 14.12.2021.
//

import Foundation

class ConversionUtils {
    static func convert(_ fromCurrency: String, _ toCurrency: String, for amount: Double) -> Double {
        switch fromCurrency {
        case "euro":
            switch toCurrency {
            case "leu":
                return amount * 4.91
            case "dolar":
                return amount * 1.17
            default:
                return amount
            }
        case "dolar":
            switch toCurrency {
            case "leu":
                return amount * 4.20
            case "euro":
                return amount * 0.85
            default:
                return amount
            }
        default:
            switch toCurrency {
            case "euro":
                return amount * 0.20
            case "dolar":
                return amount * 0.24
            default:
                return amount
            }
        }
    }
}
