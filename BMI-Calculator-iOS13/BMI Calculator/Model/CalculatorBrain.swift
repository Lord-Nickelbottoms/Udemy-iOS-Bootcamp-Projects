//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Nizaam Haffejee on 2024/04/01.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bMIValue = weight / pow(height, 2)
        
        if bMIValue < 18.5 {
            bmi = BMI(calculatedValue: bMIValue, pieceOfAdvice: "Eat more pies", color: UIColor(red: 0.431, green: 0.670, blue: 0.980, alpha: 1.0))
        } else if bMIValue < 24.9 {
            bmi = BMI(calculatedValue: bMIValue, pieceOfAdvice: "Fit as a fiddle.", color: UIColor(red: 0.639, green: 0.969, blue: 0.494, alpha: 1.0))
        } else {
            bmi = BMI(calculatedValue: bMIValue, pieceOfAdvice: "Eat fewer pies.", color: UIColor(red: 1.0, green: 0.415, blue: 0.596, alpha: 1.0))
        }
    }
    
    func getBMIValue() -> String {
        let formattedBMI = String(format: "%.1f", bmi?.calculatedValue ?? 0.0)
        return formattedBMI
    }
    
    func getAdvice() -> String {
        return bmi?.pieceOfAdvice ?? ""
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
}
