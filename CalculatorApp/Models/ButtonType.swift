//
//  ButtonType.swift
//  CalculatorApp
//
//  Created by Alexey Budynkov on 23.01.2023.
//

import Foundation
import SwiftUI


enum ButtonType: Hashable, CustomStringConvertible {
    case digit(_ digit: Digit)
    case operation(_ operation: ArithmeticOperation)
    case negative
    case sin
    case cos
    case decimal
    case equals
    case allClear
    case clear
    
    var description: String {
        switch self {
        case .digit(let digit):
            return digit.description
        case .operation(let operation):
            return operation.description
        case .negative:
            return "±"
        case .sin:
            return "sin"
        case .cos:
            return "cos"
        case .decimal:
            return "."
        case .equals:
            return "="
        case .allClear:
            return "AC"
        case .clear:
            return "C"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .allClear, .clear, .negative:
            return Color(.lightGray)
        case .operation, .equals:
            return .orange
        case .digit, .decimal:
            return .secondary
        case .sin:
            return Color(.lightGray)
        case .cos:
            return Color(.lightGray)
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .allClear, .clear, .negative:
            return .black
        default:
            return .white
        }
    }
}


