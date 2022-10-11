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
    
    let todoManager = CoreDataManager.shred
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setNaviBar()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //MARK: - prepare method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            guard let detailVC = segue.destination as? DetailViewController else { return }
            
            guard let indexPath = sender as? IndexPath else { return }
            detailVC.todoData = todoManager.getMemoDataFromCoreData()[indexPath.row]
        }
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
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoManager.getMemoDataFromCoreData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "MemoCell",
            for: indexPath
        ) as? MemoCell else { return UITableViewCell() }
        let todoData = todoManager.getMemoDataFromCoreData()
        cell.todoData = todoData[indexPath.row]
        cell.updateButtonPressed = { [weak self] (senderCell) in
            self?.performSegue(withIdentifier: "toDetailVC", sender: indexPath)
        }
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
