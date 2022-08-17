//
//  ViewController.swift
//  Rock Paper Scissors RockPaperScissorsGame
//
//  Created by 효우 on 2022/08/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var comLabel: UILabel!
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func didTapRPSButton(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
//        switch title {
//        case "가위":
//        case "바위":
//        case "보":
//        default:
//            break
//        }
        print(title)
    }
    
    @IBAction func didTapResetButton(_ sender: UIButton) {
        
    }
    
    @IBAction func didTapSelectButton(_ sender: UIButton) {
        
    }
}

