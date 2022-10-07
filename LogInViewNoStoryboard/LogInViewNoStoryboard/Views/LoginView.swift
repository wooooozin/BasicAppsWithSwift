//
//  LoginView.swift
//  LogInViewNoStoryboard
//
//  Created by 효우 on 2022/10/07.
//

import UIKit

class LoginView: UIView {
    
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
    
    lazy var passwordSecureButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("표시", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        button.addTarget(self, action: #selector(passwordSecureModeSetting), for: .touchUpInside)
        return button
    }()
    
    lazy var loginButton: UIButton = {
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
        return button
    }()
    
    lazy var passwordResetButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("비밀번호 재설정", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
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
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        addView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Method
    func setup() {
        backgroundColor = .white
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func addView() {
        [stackView, passwordResetButton].forEach { addSubview($0) }
    }
    
    private func setConstraints() {
        emailLabelConstraints()
        emailTextFieldConstraints()
        passwordLabelConstraints()
        passwordTextFieldConstraints()
        passwordSecureButtonConstraints()
        stackViewConstraints()
        passwordResetButtonConstraints()
    }
    
    private func emailLabelConstraints() {
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailLabel.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 8),
            emailLabel.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: 8),
            emailLabelCenterYConstraint
        ])
    }
    
    private func emailTextFieldConstraints() {
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 8),
            emailTextField.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: 8),
            emailTextField.topAnchor.constraint(equalTo: emailView.topAnchor, constant: 15),
            emailTextField.bottomAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 2)
        ])
    }
    
    private func passwordLabelConstraints() {
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordLabel.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 8),
            passwordLabel.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: 8),
            passwordLabelCenterYConstraint
        ])
    }
    
    private func passwordTextFieldConstraints() {
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 8),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: 8),
            passwordTextField.topAnchor.constraint(equalTo: passwordView.topAnchor, constant: 15),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 2)
        ])
    }
    
    private func passwordSecureButtonConstraints() {
        passwordSecureButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordSecureButton.topAnchor.constraint(equalTo: passwordView.topAnchor, constant: 15),
            passwordSecureButton.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: -15),
            passwordSecureButton.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: -8)
        ])
    }
    
    private func stackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: textViewHeight * 3 + 36)
        ])
    }
    
    private func passwordResetButtonConstraints() {
        passwordResetButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordResetButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            passwordResetButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            passwordResetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            passwordResetButton.heightAnchor.constraint(equalToConstant: textViewHeight)
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
    //MARK: - @objc Method
    @objc private func passwordSecureModeSetting() {
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
}

//MARK: - UITextFieldDelegate
extension LoginView: UITextFieldDelegate {
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
