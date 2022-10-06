//
//  ViewController.swift
//  BMI
//
//  Created by 효우 on 2022/10/06.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    var result: Double?
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        heightTextField.delegate = self
        weightTextField.delegate = self
        makeUI()
    }
    
    // MARK: - Actions

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        guard let height = heightTextField.text,
              let weight = weightTextField.text else { return }
        result = calculateBMI(height: height, weight: weight)
    }
}

// MARK: - Methods

extension ViewController {
    func makeUI() {
        mainLabel.text = "키와 몸무게를 입력해주세요"
        heightTextField.placeholder = "cm단위로 입력해주세요"
        weightTextField.placeholder = "kg단위로 입력해주세요"
        
        calculateButton.layer.cornerRadius = 5
        calculateButton.clipsToBounds = true
        calculateButton.setTitle("BMI 계산하기", for: .normal)
    }
    
    func calculateBMI(height: String, weight: String) -> Double {
        guard let height = Double(height),
              let weight = Double(weight) else { return 0.0 }
        var bmi = weight / (height * height) * 10000
        bmi = round(bmi * 10) / 10
        return bmi
    }
    
    func getBmiResult() -> (UIColor, String) {
        guard let result = result else { return (UIColor.clear, "") }
        switch result {
        case ..<18.6:
            return (.systemBlue, "저체중")
        case 18.6..<23.0:
            return (.systemGreen, "GOOD")
        case 23.0..<25.0:
            return (.systemPink, "과체중")
        case 25.0..<30.0:
            return (.systemOrange, "중도비만")
        case 30.0...:
            return (.systemRed, "고도비만")
        default:
            return (.black, "")
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.textColor = .red
            return false
        }
        mainLabel.text = "키와 몸무게를 입력해주세요"
        mainLabel.textColor = .black
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultVC" {
            let resultVC = segue.destination as? ResultViewController
            resultVC?.bmiResult = result
            resultVC?.adviceText = getBmiResult().1
            resultVC?.bmiColor = getBmiResult().0
        }
        heightTextField.text = ""
        weightTextField.text = ""
    }
}


// MARK: - UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        if Int(string) != nil || string == "" {
            return true
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
}


