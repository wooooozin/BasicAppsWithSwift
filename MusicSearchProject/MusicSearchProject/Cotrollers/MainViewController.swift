//
//  ViewController.swift
//  MusicSearchProject
//
//  Created by 효우 on 2022/10/11.
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: - Property
    
    let searchController = UISearchController(
        searchResultsController: UIStoryboard(
            name: "Main",
            bundle: nil
        ).instantiateViewController(
            withIdentifier: "SearchResultViewController"
        ) as? SearchResultViewController
    )
    
    @IBOutlet weak var musicTableView: UITableView!
    
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupTableView()
    }
    
}

// MARK: - SetUI Method

extension MainViewController {
    func setupSearchBar() {
        self.title = "Music Search"
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.automaticallyShowsCancelButton = true
        searchController.searchBar.autocapitalizationType = .none
    }
    
    func setupTableView() {
        musicTableView.dataSource = self
        musicTableView.delegate = self
        musicTableView.register(UINib(nibName: "MusicCell", bundle: nil), forCellReuseIdentifier: "MusicCell")
    }
}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = musicTableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath) as? MusicCell else { return UITableViewCell()}
        
        return cell
    }
    
    
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - UISearchResultsUpdating

extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print("searchBar words", searchController.searchBar.text ?? "")
//        guard let vc = searchController.searchResultsController as? SearchResultViewController else { return }
        
    }
}
