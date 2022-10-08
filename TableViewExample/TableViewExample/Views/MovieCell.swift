//
//  MovieCell.swift
//  TableViewExample
//
//  Created by 효우 on 2022/10/08.
//

import UIKit

class MovieCell: UITableViewCell {
    
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
