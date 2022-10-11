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
    
    // MARK: - Property
    
    var todoData: MemoData? {
        didSet {
            configureUIwithData()
        }
    }

    var updateButtonPressed: (MemoCell) -> Void = { (sender) in }

    
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
    
    // MARK: - Method
    func configureUIwithData() {
        memoTextLabel.text = todoData?.memoText
        dateTextLabel.text = todoData?.dateString
        guard let colorNum = todoData?.color else { return }
//        let color = MyColor(rawValue: colorNum) ?? .red
//        updateButton.backgroundColor = color.buttonColor
//        backGroundView.backgroundColor = color.backgoundColor
    }
    
    @IBAction func updateButtonTapped(_ sender: UIButton) {
        updateButtonPressed(self)
    }
    
}


