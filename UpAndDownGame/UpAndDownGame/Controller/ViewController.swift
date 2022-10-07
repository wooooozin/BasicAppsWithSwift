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
    
    var upDownManager = UpDownManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }
    
    func reset() {
        resultLabel.text = "SELECT"
        selectLabel.text = "Your Number"
        upDownManager.resetNum()
    }
    
    @IBAction func didTapChooseNumber(_ sender: UIButton) {
        guard let numberString = sender.currentTitle else { return }
        selectLabel.text = numberString
        guard let num = Int(numberString) else { return }
        upDownManager.setUsersNum(num: num)
    }
    
    @IBAction func didTapReset(_ sender: UIButton) {
        reset()
    }
    
    @IBAction func didTapSelect(_ sender: UIButton) {
        guard let myNumberStr = selectLabel.text else { return }
        guard let myNumber = Int(myNumberStr) else { return }
        
        upDownManager.setUsersNum(num: myNumber)
        resultLabel.text = upDownManager.getUpDownResult()
    }
}
