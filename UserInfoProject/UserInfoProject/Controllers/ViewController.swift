//
//  ViewController.swift
//  UserInfoProject
//
//  Created by 효우 on 2022/10/09.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Property
    private let tableView = UITableView()
    
    var userListManager = UserListManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupDatas()
        setupTableView()
        setupNavigationBar()
        setupTableViewConstraints()
    }
}



extension ViewController {
    
    // MARK: - setupUI
    
    private func setupNavigationBar() {
        navigationItem.title = "회원 목록"
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
//        self.navigationItem.rightBarButtonItem = self.plustButton
    }
    
    private func setupTableViewConstraints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 0
            ),
            tableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: 0
            ),
            tableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 0
            ),
            tableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: 0
            )
        ])
    }
    
    // MARK: - Methods
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupDatas() {
        userListManager.makeUserListData()
    }

}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userListManager.getUserList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
}