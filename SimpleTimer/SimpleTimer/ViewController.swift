//
//  ViewController.swift
//  SimpleTimer
//
//  Created by 효우 on 2022/10/03.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Property
    @IBOutlet weak var timerSlider: UISlider!
    @IBOutlet weak var mainLabel: UILabel!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        
    }
    
    //MARK: - Action
    @IBAction func sliderChanged(_ sender: UISlider) {
        let seconds = Int(sender.value)
        mainLabel.text = "\(seconds) 초"
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        mainLabel.text = "초를 선택하세요!"
        timerSlider.setValue(30, animated: true)
    }
    
    
}
    //MARK: - Method
extension ViewController {
    func configureUI() {
        mainLabel.text = "초를 선택하세요!"
        timerSlider.value = 30
    }
}

