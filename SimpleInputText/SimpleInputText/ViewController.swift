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
    
    //MARK: - Action
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        
    }
}

    //MARK: - Method
extension ViewController {
    func configureUI() {
        view.backgroundColor = .systemGray5
        doneButton.isEnabled = false
        
        textField.delegate = self
        textField.keyboardType = .emailAddress
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .next
        textField.placeholder = "E-mail"
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
}
