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
    
    lazy var plusButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupDatas()
        setupTableView()
        setupNavigationBar()
        setupTableViewConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
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
        self.navigationItem.rightBarButtonItem = self.plusButton
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
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "UserCell")
    }
    
    private func setupDatas() {
        userListManager.makeUserListData()
    }
    
    @objc func plusButtonTapped() {
        let detailVC = DetailViewController()
        //detailVC.delegate = self
        navigationController?.pushViewController(detailVC, animated: true)
    }

}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userListManager.getUserList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "UserCell",
            for: indexPath
        ) as? MyTableViewCell else {
            return UITableViewCell()
        }
        
        cell.user = userListManager[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        let array = userListManager.getUserList()
        vc.user = array[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
