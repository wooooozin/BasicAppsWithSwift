//
//  ViewController.swift
//  SimpleInputText
//
//  Created by 효우 on 2022/10/04.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Property
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureButtonObservers()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: - Action
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
    }
}

    //MARK: - Method
extension ViewController {
    func configureUI() {
        view.backgroundColor = .systemGray5
        doneButton.isEnabled = false
        
        textField.keyboardType = .emailAddress
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .next
        textField.placeholder = "E-mail"
        textField.becomeFirstResponder()
        textField.delegate = self
    }
    
    func configureButtonObservers() {
        textField.addTarget(self, action: #selector(textDidChaging), for: .editingChanged)
    }
    
    @objc func textDidChaging(sender: UITextField) {
        if sender.text == "" {
            doneButton.isEnabled = false
        } else {
            doneButton.isEnabled = true
        }
    }
}

    //MARK: - Delegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("입력 시작")
    }
    
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let maxLength = 10
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            textField.placeholder = "Type Email"
            return false
        } else {
            return true
        }
    }
}
