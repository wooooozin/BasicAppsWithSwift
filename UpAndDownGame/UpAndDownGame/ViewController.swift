//
//  ViewController.swift
//  UpAndDownGame
//
//  Created by 효우 on 2022/08/19.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var selectLabel: UILabel!
    
    var randomNumber = Int.random(in: 1...10)
//    var myNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "SELECT"
        selectLabel.text = "Your Number"
    }
    
    @IBAction func didTapChooseNumber(_ sender: UIButton) {
        guard let numberString = sender.currentTitle else { return }
        selectLabel.text = numberString
//        guard let number = Int(numberString) else { return }
//        myNumber = number
    }
    
    @IBAction func didTapReset(_ sender: UIButton) {
        randomNumber = Int.random(in: 1...10)
        resultLabel.text = "SELECT"
        selectLabel.text = "Your Number"
    }
    
    @IBAction func didTapSelect(_ sender: UIButton) {
        guard let myNumberStr = selectLabel.text else { return }
        guard let myNumber = Int(myNumberStr) else { return }
        
        if randomNumber > myNumber {
            selectLabel.text = "UP"
        } else if randomNumber < myNumber {
            selectLabel.text = "DOWN"
        } else {
            selectLabel.text = "BINGO! 😍"
        }
    }
}
