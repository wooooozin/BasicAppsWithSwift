//
//  ViewController.swift
//  LogInViewNoStoryboard
//
//  Created by 효우 on 2022/10/05.
//

import UIKit

final class ViewController: UIViewController { // 상속안함, 다이렉트 디스패치로 작동
    
    // MARK: - Properties
    private lazy var emailView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.addSubview(emailTextField)
        view.addSubview(emailLabel)
        return view
    }()
    
    private var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일주소 또는 전화번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress
        tf.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        return tf
    }()
    
    private lazy var passwordView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.addSubview(passwordTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordSecureButton)
        return view
    }()
    
    private var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.isSecureTextEntry = true
        tf.clearsOnBeginEditing = false
        tf.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        return tf
    }()
    
    private lazy var passwordSecureButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("표시", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        button.addTarget(self, action: #selector(passwordSecureModeSetting), for: .touchUpInside)
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .orange.withAlphaComponent(0.5)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.orange.cgColor
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.isEnabled = false
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var passwordResetButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("비밀번호 재설정", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [emailView, passwordView, loginButton])
        st.axis = .vertical
        st.spacing = 18
        st.distribution = .fillEqually
        st.alignment = .fill
        return st
    }()
    
    private let textViewHeight: CGFloat = 48
    
    private lazy var emailLabelCenterYConstraint = emailLabel.centerYAnchor.constraint(equalTo: emailView.centerYAnchor)
    private lazy var passwordLabelCenterYConstraint = passwordLabel.centerYAnchor.constraint(equalTo: passwordView.centerYAnchor)

    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        makeUI()
    }

    
    //MARK: - @objc Method
    @objc func resetButtonTapped() {
        let alert = UIAlertController(title: "비밀번호 재설정", message: "비밀번호를 변경하시겠습니까?", preferredStyle: .alert)
        let successAction = UIAlertAction(title: "확인", style: .default) { action in
            print("확인 버튼")
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { cancel in
            print("취소 버튼")
        }
        
        alert.addAction(successAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    @objc func passwordSecureModeSetting() {
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    @objc func textFieldEditingChanged(sender: UITextField) {
        if sender.text?.count == 1 {
            if sender.text?.first == " " {
                sender.text = ""
                return
            }
        }
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            loginButton.backgroundColor = .orange.withAlphaComponent(0.5)
            loginButton.isEnabled = false
            return
        }
        loginButton.backgroundColor = .clear
        loginButton.isEnabled = true
    }
    
    @objc func loginButtonTapped() {
        print(#function)
    }
}

// MARK: - Methods
extension ViewController {
    func makeUI() {
        view.backgroundColor = .orange.withAlphaComponent(0.2)
        view.addSubview(stackView)
        view.addSubview(passwordResetButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordSecureButton.translatesAutoresizingMaskIntoConstraints = false
        passwordResetButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: textViewHeight * 3 + 36),
            
            emailLabel.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 8),
            emailLabel.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: 8),
            emailLabelCenterYConstraint,
//            emailLabel.centerYAnchor.constraint(equalTo: emailView.centerYAnchor),
            
            emailTextField.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 8),
            emailTextField.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: 8),
            emailTextField.topAnchor.constraint(equalTo: emailView.topAnchor, constant: 15),
            emailTextField.bottomAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 2),
            
            passwordLabel.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 8),
            passwordLabel.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: 8),
            passwordLabelCenterYConstraint,
//            passwordLabel.centerYAnchor.constraint(equalTo: passwordView.centerYAnchor),
            
            passwordTextField.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 8),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: 8),
            passwordTextField.topAnchor.constraint(equalTo: passwordView.topAnchor, constant: 15),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 2),
            
            passwordSecureButton.topAnchor.constraint(equalTo: passwordView.topAnchor, constant: 15),
            passwordSecureButton.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: -15),
            passwordSecureButton.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: -8),
            
            passwordResetButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            passwordResetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordResetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordResetButton.heightAnchor.constraint(equalToConstant: textViewHeight)
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


//MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailView.backgroundColor = .orange.withAlphaComponent(0.8)
            emailLabel.font = UIFont.systemFont(ofSize: 11)
            emailLabelCenterYConstraint.constant = -13
        }
        if textField == passwordTextField {
            passwordView.backgroundColor = .orange.withAlphaComponent(0.8)
            passwordLabel.font = UIFont.systemFont(ofSize: 11)
            passwordLabelCenterYConstraint.constant = -13
        }
        
        UIView.animate(withDuration: 0.2) {
            self.stackView.layoutIfNeeded()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailView.backgroundColor = .orange
            if emailTextField.text == "" {
                emailLabel.font = UIFont.systemFont(ofSize: 18)
                emailLabelCenterYConstraint.constant = 0
            }
        }
        if textField == passwordTextField {
            passwordView.backgroundColor = .orange
            if passwordTextField.text == "" {
                passwordLabel.font = UIFont.systemFont(ofSize: 18)
                passwordLabelCenterYConstraint.constant = 0
            }
        }
        
        UIView.animate(withDuration: 0.2) {
            self.stackView.layoutIfNeeded()
        }
    }
}
