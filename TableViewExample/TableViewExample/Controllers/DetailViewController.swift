//
//  DetailViewController.swift
//  TableViewExample
//
//  Created by 효우 on 2022/10/08.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    var movieData: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainImageView.image = movieData?.movieImage
        titleLabel.text = movieData?.movieName
        descLabel.text = movieData?.movieDescription
        
    }
    
}
