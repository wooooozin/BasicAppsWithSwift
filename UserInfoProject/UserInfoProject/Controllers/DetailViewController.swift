//
//  DetailViewController.swift
//  UserInfoProject
//
//  Created by 효우 on 2022/10/10.
//

import UIKit

final class DetailViewController: UIViewController {
    
    // MARK: - Property

    private let detailView = DetailView()
    var user: User? 
    
    // MARK: - LifeCycle

    
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupButtonAction()
    }
    
    // MARK: - Method
    
    private func setupData() {
        detailView.user = user
    }
    
    private func setupButtonAction() {
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc func saveButtonTapped() {
        print(#function)
    }
}
