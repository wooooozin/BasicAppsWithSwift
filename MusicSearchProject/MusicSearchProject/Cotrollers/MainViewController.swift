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
    
    var musicArrays: [Music] = []
    var networkManager = NetworkManager.shared
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupTableView()
        setupDatas()
    }
    
}

// MARK: - SetUI / Method

extension MainViewController {
    private func setupSearchBar() {
        self.title = "Music Search"
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.automaticallyShowsCancelButton = true
        searchController.searchBar.autocapitalizationType = .none
    }
    
    private func setupTableView() {
        musicTableView.dataSource = self
        musicTableView.delegate = self
        musicTableView.register(UINib(nibName: Cell.musicCellIdentifier, bundle: nil), forCellReuseIdentifier: Cell.musicCellIdentifier)
    }
    
    private func setupDatas() {
        networkManager.fetchMusic(searchTerm: "jazz") { result in
            switch result {
            case .success(let musicData):
                self.musicArrays = musicData
                DispatchQueue.main.async {
                    self.musicTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicArrays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = musicTableView.dequeueReusableCell(withIdentifier: Cell.musicCellIdentifier, for: indexPath) as? MusicCell else { return UITableViewCell()}
        let musicIndex = musicArrays[indexPath.row]
        
        cell.imageUrl = musicIndex.imageUrl
        cell.songNameLabel.text = musicIndex.songName
        cell.artistNameLabel.text = musicIndex.artistName
        cell.albumNameLabel.text = musicIndex.albumName
        cell.releaseDateLabel.text = musicIndex.releaseDateString
        
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
