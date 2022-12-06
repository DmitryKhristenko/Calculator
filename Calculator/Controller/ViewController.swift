//
//  ViewController.swift
//  Calculator
//
//  Created by Дмитрий Х on 25.11.22.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTypingNumber: Bool = true
    var displayValue: Double {
        get {
            // force unwrap is safe here because displayLabel.text is always has a value
            guard let number = Double(displayLabel.text!) else {
                return 0
            }
            return number
        }
        set {
            let isInt = floor(newValue) == newValue
            if isInt {
                // Remove the .0
                displayLabel.text = String(format: "%.0f", newValue)
            } else {
                displayLabel.text = String(newValue)
            }
        }
    }
    private var calculator = CalculatorLogic()
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        // What should happen when a non-number button is pressed.
        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                // this part does not allow to add a second dot to displayLabel.text
                if numValue == "." {
                    displayLabel.text = "0."
                } else {
                    displayLabel.text = numValue
                }
                isFinishedTypingNumber = false
            } else {
                if numValue == "." && displayLabel.text!.contains(".") {
                    return
                }
                displayLabel.text! += numValue
            }
        }
    }
}
