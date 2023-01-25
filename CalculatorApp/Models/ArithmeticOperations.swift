//
//  ArithmeticOperations.swift
//  CalculatorApp
//
//  Created by Alexey Budynkov on 25.01.2023.
//

import Foundation

enum ArithmeticOperation: CaseIterable, CustomStringConvertible {
    case addition, subtraction, multiplication, division, none
    
    var description: String {
        switch self {
        case .addition:
            return "+"
        case .subtraction:
            return "−"
        case .multiplication:
            return "×"
        case .division:
            return "÷"
        case .none:
            return ""
        }
    }
}
