//
//  BMICalculatorManager.swift
//  BMI
//
//  Created by 효우 on 2022/10/07.
//

import UIKit

struct BMICalculatorManager {
    var result: BMIModel?
    
    mutating func getBMIResult(height: String, weight: String) -> BMIModel {
        calculateBMI(height: height, weight: weight)
        return result ?? BMIModel(value: 0.0, matchColor: .black, advice: "문제 발생")
    }
    
    mutating private func calculateBMI(height: String, weight: String) {
        guard let height = Double(height),
              let weight = Double(weight) else {
            result = BMIModel(value: 0.0, matchColor: .black, advice: "문제 발생")
            return
        }
        
        var bmi = weight / (height * height) * 10000
        bmi = round(bmi * 10) / 10
        
        switch bmi {
        case ..<18.6:
            return result = BMIModel(value: bmi, matchColor: .systemBlue, advice: "저체중")
        case 18.6..<23.0:
            return result = BMIModel(value: bmi, matchColor: .systemGreen, advice: "GOOD")
        case 23.0..<25.0:
            return result = BMIModel(value: bmi, matchColor: .systemPink, advice: "저체과체중중")
        case 25.0..<30.0:
            return result = BMIModel(value: bmi, matchColor: .systemOrange, advice: "중도비만")
        case 30.0...:
            return result = BMIModel(value: bmi, matchColor: .systemRed, advice: "고도비만")
        default:
            return result = BMIModel(value: bmi, matchColor: .black, advice: "")
        }
    }
}
