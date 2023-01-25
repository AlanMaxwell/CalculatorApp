//
//  Digit.swift
//  CalculatorApp
//
//  Created by Alexey Budynkov on 25.01.2023.
//

import Foundation

enum Digit: Int, CaseIterable, CustomStringConvertible {
    case zero, one, two, three, four, five, six, seven, eight, nine
    
    var description: String {
        "\(rawValue)"
    }
}
