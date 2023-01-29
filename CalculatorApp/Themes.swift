//
//  Themes.swift
//  CalculatorApp
//
//  Created by Alexey Budynkov on 26.01.2023.
//

import Foundation
import UIKit
import SwiftUI
import Combine


// This will let you use a theme in the app.
class ThemeManager {
    
    enum Theme: Int {

        case defaultTheme, colored

        var digitButtonColor: Color {
            switch self {
            case .defaultTheme:
                return .secondary
            case .colored:
                return .purple
            }
        }

        var functionalButtonColor: Color {
            switch self {
            case .defaultTheme:
                return Color(.lightGray)
            case .colored:
                return Color(.systemBlue)
            }
        }

        var operationButtonColor: Color {
            switch self {
            case .defaultTheme:
                return .orange
            case .colored:
                return .blue
            }
        }

    }
    
    static var themeSubject = CurrentValueSubject<Theme, Never>(.defaultTheme)
    
    static func applyTheme(theme: Theme) {
        themeSubject.send(theme)
    }
}
