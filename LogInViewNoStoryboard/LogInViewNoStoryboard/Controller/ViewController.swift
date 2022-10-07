//
//  ViewController.swift
//  LogInViewNoStoryboard
//
//  Created by 효우 on 2022/10/05.
//

import UIKit

final class ViewController: UIViewController { // 상속안함, 다이렉트 디스패치로 작동
    
    // MARK: - Properties
    private let loginView = LoginView()
    
    //MARK: - LifeCycle
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print()
        setupAddTarget()
    }
    
    func setupAddTarget() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginView.passwordResetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
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
    
    @objc func loginButtonTapped() {
        print(#function)
    }
}
