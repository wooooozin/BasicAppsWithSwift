//
//  SearchResultViewController.swift
//  MusicSearchProject
//
//  Created by 효우 on 2022/10/11.
//

import UIKit

final class SearchResultViewController: UIViewController {
    
    // MARK: - Property
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let flowLayout = UICollectionViewFlowLayout()
    let networkManager = NetworkManager.shared
    var musicArrays: [Music] = []
    var searchTerm: String? {
        didSet {
            setupDatas()
        }
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
    }
}

// MARK: - SetUI / Methods

extension SearchResultViewController {
    func setupCollectionView() {
        
        collectionView.dataSource = self
        collectionView.register(
            UINib(
                nibName: Cell.musicCollectionViewCellIdentifier,
                bundle: nil
            ), forCellWithReuseIdentifier: Cell.musicCollectionViewCellIdentifier
        )
        collectionView.backgroundColor = .white
        flowLayout.scrollDirection = .vertical
        
        let collectionCellWidth = (UIScreen.main.bounds.width - CVCell.spacingWitdh * (CVCell.cellColumns - 1)) / CVCell.cellColumns
        
        flowLayout.itemSize = CGSize(width: collectionCellWidth, height: collectionCellWidth)
        flowLayout.minimumInteritemSpacing = CVCell.spacingWitdh
        flowLayout.minimumLineSpacing = CVCell.spacingWitdh
        
        collectionView.collectionViewLayout = flowLayout
    }
    
    func setupDatas() {
        guard let term = searchTerm else { return }
        print("네트워킹 시작 단어 \(term)")
        self.musicArrays = []
        
        networkManager.fetchMusic(searchTerm: term) { result in
            switch result {
            case .success(let musicDatas):
                self.musicArrays = musicDatas
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - UICollectionViewDataSource

extension SearchResultViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicArrays.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.musicCollectionViewCellIdentifier, for: indexPath) as? MusicCollectionViewCell else { return UICollectionViewCell() }
        cell.imageUrl = musicArrays[indexPath.item].imageUrl
        return cell
    }
}

