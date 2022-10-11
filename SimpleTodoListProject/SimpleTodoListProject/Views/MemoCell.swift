//
//  MemoCell.swift
//  SimpleTodoListProject
//
//  Created by 효우 on 2022/10/11.
//

import UIKit

final class MemoCell: UITableViewCell {

    // MARK: - @IBOutlet

    @IBOutlet weak var backGroundView: UIView!
    
    @IBOutlet weak var memoTextLabel: UILabel!
    @IBOutlet weak var dateTextLabel: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // MARK: - setUI
    func configureUI() {
        backGroundView.clipsToBounds = true
        backGroundView.layer.cornerRadius = 8
        
        updateButton.clipsToBounds = true
        updateButton.layer.cornerRadius = 10
    }
}


