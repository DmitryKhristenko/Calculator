//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Дмитрий Х on 30.11.22.
//

import UIKit

struct CalculatorLogic {
    
    var number: Double
    
    func calculate(symbol: String) -> Double? {
        if symbol == "+/-" {
            return number * -1
        } else if symbol == "AC" {
            return 0
        } else if symbol == "%" {
            return number / 100
        }
        return nil
    }
    
}
