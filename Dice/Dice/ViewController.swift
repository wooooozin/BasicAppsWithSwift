//
//  ViewController.swift
//  Dice
//
//  Created by 효우 on 2022/08/16.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var diceRollButton: UIButton!
    @IBOutlet weak var leftDiceImageView: UIImageView!
    @IBOutlet weak var rightDiceImageView: UIImageView!
    
    var diceImageList: [UIImage] = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    @IBAction func didTapDiceRoll(_ sender: UIButton) {
        leftDiceImageView.image = diceImageList.randomElement()
        rightDiceImageView.image = diceImageList.randomElement()
    }
}

extension ViewController {
    func setUI() {
        mainLabel.text = "DICE GAME"
        mainLabel.font = .systemFont(ofSize: 40, weight: .bold)
        mainLabel.textAlignment = .center
        
        diceRollButton.setTitle("ROLL", for: .normal)
        diceRollButton.tintColor = .black
        diceRollButton.titleLabel?.textAlignment = .center
        diceRollButton.titleLabel?.font = .systemFont(ofSize: 40, weight: .bold)
        
        leftDiceImageView.image = diceImageList.first
        rightDiceImageView.image = diceImageList.first
    }
}
