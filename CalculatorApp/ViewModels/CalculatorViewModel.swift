//
//  CalculatorViewModel.swift
//  CalculatorApp
//
//  Created by Alexey Budynkov on 23.01.2023.
//

import SwiftUI
import Calculator
import Combine

//TODO: btc should be on a separate page, the calculator on its page
//TODO: make a separate page with toggling of different operations

class CalculatorViewModel: ObservableObject {
    
    @Published var firstNumber = "0"
    @Published var secondNumber = "0"
    @Published var operation:ArithmeticOperation = .none

    @Published var number = "0"
    
    @Published var signToggled = false
    @Published var decimalToggled = false
    
    @Published var operationClear = false
    @Published var pressedClear = false
    
    @Published var additionIsOn = true
    @Published var subtractionIsOn = true
    @Published var multiplicationIsOn = true
    @Published var divisionIsOn = true
    
    
    @Published var themeSwitcher = false {
        didSet{
            if themeSwitcher == false {
                ThemeManager.applyTheme(theme: .defaultTheme)
            }
            else{
                ThemeManager.applyTheme(theme: .colored)
            }
            
        }
    }
    var calculator = Calculator()
    
    var showAllClear: Bool {
        let val = firstNumber == "0" && secondNumber == "0" && number == "0" || pressedClear
        return val
    }
    
    var buttons: [ButtonType] {
        let clearType: ButtonType = showAllClear ? .allClear : .clear
        
        let addition = ButtonType.operation(ArithmeticOperation.addition, enabled: additionIsOn)
        let subtraction = ButtonType.operation(ArithmeticOperation.subtraction, enabled: subtractionIsOn)
        let multiplication = ButtonType.operation(ArithmeticOperation.multiplication, enabled: multiplicationIsOn)
        let division = ButtonType.operation(ArithmeticOperation.division, enabled: divisionIsOn)
        
        return [
        clearType, .negative, .sin, .cos, division,
        .digit(.seven), .digit(.eight), .digit(.nine), multiplication,
        .digit(.four), .digit(.five), .digit(.six), subtraction,
        .digit(.one), .digit(.two), .digit(.three), addition,
        .digit(.zero), .decimal, .equals
        ]
    }
    
    func tapAction(button: ButtonType){
        switch button {
        case .digit(let digit):
            addDigit(digit: digit)
        case .operation(let operation, let enabled):
            if enabled {
                self.operation = operation
                self.firstNumber = number
                self.operationClear = true
            }

        case .negative:
            toggleSign()
        case .sin:
            number = "\(calculator.calculateSin(degrees: Double(number) ?? 0))"
        case .cos:
            number = "\(calculator.calculateCos(degrees: Double(number) ?? 0))"
        case .decimal:
            toggleDecimal()
        case .equals:
            self.secondNumber = self.number
            let firstNum = Double(firstNumber) ?? 0
            let secondNum = Double(secondNumber) ?? 0
            number = "\(String(format: "%g", calculator.evaluate(firstNumber: firstNum, secondNumber: secondNum, operation: operation)))"
            self.operationClear = true
            self.operation = .none
        case .allClear:
            print("allClear")
            allClear()
        case .clear:
            print("clear")
            clear()
        }
    }
    
    func addDigit(digit:Digit){
        if operationClear {
            number = "0"
            operationClear = false
        }
        
        self.number == "0" ? self.number = "\(digit.rawValue)" : self.number.append("\(digit.rawValue)")
        self.pressedClear = false
    }
    
    func toggleSign() {
        if !signToggled {
            signToggled = true
            number = "-\(number)"
        }
        else{
            signToggled = false
            number.removeFirst()
        }
    }
    
    func toggleDecimal() {
        if decimalToggled {
            return
        }
        
        number.append(".")
    }
    
    
    func allClear() {
        number = "0"
        firstNumber = "0"
        secondNumber = "0"
        operation = .none
        signToggled = false
        decimalToggled = false
        pressedClear = false
    }
    
    func clear() {
        if number == "0" && firstNumber == "0"{
            operation = .none
        }
        
        number = "0"
        signToggled = false
        decimalToggled = false
        pressedClear = true
    }
    
    
    init() {
        
    }
    
}
