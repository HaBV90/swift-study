//
//  CalculateBrain.swift
//  BMI Calculator
//
//  Created by HaBV on 24/11/2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        
        switch bmiValue {
        case ...18.5:
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: UIColor.blue)
        case ...24.9:
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle", color: UIColor.green)
        case 24.9...:
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: UIColor.red)
        default:
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: UIColor.blue)
        }

    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getAdviceValue() -> String {
        return bmi?.advice ?? ""
    }
    
    func getColorValue() -> UIColor {
        return bmi?.color ?? UIColor.blue
    }
}
