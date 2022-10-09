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

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        setupTableViewConstraints()
    }
}

// MARK: - setupTableViewConstraints

extension ViewController {
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
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
}
