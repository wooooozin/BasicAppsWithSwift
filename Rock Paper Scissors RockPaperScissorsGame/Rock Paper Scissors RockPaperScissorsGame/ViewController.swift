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
    
    var myChoice = Rps.rock
    var comChoice = Rps(rawValue: Int.random(in: 0...2))!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func didTapRPSButton(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        switch title {
        case "가위":
            myChoice = Rps.scissors
        case "바위":
            myChoice = Rps.rock
        case "보":
            myChoice = Rps.paper
        default:
            break
        }
    }
    
    @IBAction func didTapResetButton(_ sender: UIButton) {
        mainLabel.text = "SELECT"
        myLabel.text = "Ready"
        comLabel.text = "Ready"
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
    }
    
    @IBAction func didTapSelectButton(_ sender: UIButton) {
        switch comChoice {
        case Rps.rock:
            comLabel.text = "바위"
        case Rps.paper:
            comLabel.text = "보"
        case Rps.scissors:
            comLabel.text = "가위"
        }
        
        switch myChoice {
        case Rps.rock:
            myLabel.text = "바위"
        case Rps.paper:
            myLabel.text = "보"
        case Rps.scissors:
            myLabel.text = "가위"
        }
        
        if comChoice == myChoice {
            mainLabel.text = "DRAW"
        } else if comChoice == .paper && myChoice == .scissors {
            mainLabel.text = "WIN"
        } else if comChoice == .scissors && myChoice == .rock {
            mainLabel.text = "WIN"
        } else if comChoice == .rock && myChoice == .paper {
            mainLabel.text = "WIN"
        } else {
            mainLabel.text = "LOSE"
        }
    }
}

