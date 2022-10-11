//
//  MainViewController.swift
//  SimpleTodoListProject
//
//  Created by 효우 on 2022/10/11.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - @IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Property
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNaviBar()
        setupTableView()
    }
}

// MARK: - setNavigation, TableView

extension MainViewController {
    func setNaviBar() {
        self.title = "MEMO"
        let plusButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(plusButtonTapped)
        )
        plusButton.tintColor = .black
        navigationItem.rightBarButtonItem = plusButton
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(
            UINib(
                nibName: "MemoCell",
                bundle: nil
            ),
            forCellReuseIdentifier: "MemoCell"
        )
    }
    
    // MARK: - @objc method
    @objc func plusButtonTapped() {
        
    }
}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "MemoCell",
            for: indexPath
        ) as? MemoCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        
        return cell
    }
}

// MARK: - UITableViewDelegate<##>

extension MainViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        estimatedHeightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return UITableView.automaticDimension
    }
}
