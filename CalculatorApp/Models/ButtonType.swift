//
//  ButtonType.swift
//  CalculatorApp
//
//  Created by Alexey Budynkov on 23.01.2023.
//

import Foundation
import SwiftUI
import Calculator


enum ButtonType: Hashable, CustomStringConvertible {
    case digit(_ digit: Digit)
    case operation(_ operation: ArithmeticOperation, enabled: Bool)
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
        case .operation(let operation, _):
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
        let theme = ThemeManager.themeSubject.value
        switch self {
        case .allClear, .clear, .negative:
            return theme.functionalButtonColor
        case .operation(_, let enabled):
            if enabled {
                return theme.operationButtonColor
            }
            return Color(.darkGray)
        case .equals:
            return theme.operationButtonColor
        case .digit, .decimal:
            return theme.digitButtonColor
        case .sin:
            return theme.functionalButtonColor
        case .cos:
            return theme.functionalButtonColor
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .allClear, .clear, .negative, .sin, .cos:
            return .black
        default:
            return .white
        }
    }
    
}


