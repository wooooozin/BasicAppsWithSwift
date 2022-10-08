//
//  ViewController.swift
//  TableViewExample
//
//  Created by 효우 on 2022/10/08.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Property
    
    @IBOutlet weak var tableVIew: UITableView!
    
//    var movieData: [Movie] = []
    var movieDataManager = DataManager()
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableVIew.dataSource = self
        tableVIew.delegate = self
        tableVIew.rowHeight = 120
        
        movieDataManager.makeMovieData()
//        movieData = movieDataManager.getMovieData()
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return movieDataManager.getMovieData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell else { return UITableViewCell()}
        let movie = movieDataManager.getMovieData()[indexPath.row]
        cell.mainImageView.image = movie.movieImage
        cell.titleLabel.text = movie.movieName
        cell.descLabel.text = movie.movieDescription
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
}
