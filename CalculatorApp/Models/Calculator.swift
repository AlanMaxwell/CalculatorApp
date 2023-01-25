//
//  Calculator.swift
//  CalculatorApp
//
//  Created by Alexey Budynkov on 25.01.2023.
//

import Foundation

class Calculator {
    
    func calculateSin(degrees:Double) -> Double {
        __sinpi(degrees/180.0)
    }
    
    func calculateCos(degrees:Double) -> Double {
        __cospi(degrees/180.0)
    }
    
    func evaluate(firstNumber:Double, secondNumber:Double, operation:ArithmeticOperation)->Double {
        var result:Double
        switch operation {
        case .addition:
            result = firstNumber + secondNumber
        case .subtraction:
            result = firstNumber - secondNumber
        case .multiplication:
            result = firstNumber * secondNumber
        case .division:
            result = firstNumber / secondNumber
        case .none:
            result = 0.0
        }
        
        return result
    }

}

