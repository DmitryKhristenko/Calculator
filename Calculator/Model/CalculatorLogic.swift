//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Дмитрий Х on 30.11.22.
//

import UIKit

struct CalculatorLogic {
    private var number: Double?
    private var intermediateCalculation: (num1: Double, calcMethod: String)?
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    mutating func calculate(symbol: String) -> Double? {
        if let num = number {
            switch symbol {
            case "+/-":
                return num * -1
            case "AC":
                return 0
            case "%":
                return num / 100
            case "=":
                return performTwoNumCalculation(num2: num)
            default:
                intermediateCalculation = (num1: num, calcMethod: symbol)
            }
        }
        return nil
    }
    private func performTwoNumCalculation(num2: Double) -> Double? {
        if let num1 = intermediateCalculation?.num1, let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return num1 + num2
            case "-":
                return  num1 - num2
            case "×":
                return  num1 * num2
            case "÷":
                return  num1 / num2
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        return nil
    }
}
