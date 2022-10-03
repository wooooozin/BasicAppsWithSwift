//
//  ViewController.swift
//  SimpleTimer
//
//  Created by 효우 on 2022/10/03.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //MARK: - Property
    @IBOutlet weak var timerSlider: UISlider!
    @IBOutlet weak var mainLabel: UILabel!
    
    weak var timer: Timer?
    var timerNumber: Int = 0
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Action
    @IBAction func sliderChanged(_ sender: UISlider) {
        timerNumber = Int(sender.value)
        mainLabel.text = "⏰ \(timerNumber) 초"
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        setTimer()
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        mainLabel.text = "초를 선택하세요 ⏰"
        timerSlider.value = 30
        timerNumber = 0
        timer?.invalidate()
    }
    
    
}
//MARK: - Method
extension ViewController {
    func configureUI() {
        mainLabel.text = "초를 선택하세요 ⏰"
        timerSlider.value = 30
        timerNumber = Int(timerSlider.value)
    }
    
    func setTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(doSometingAfterTimer),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc func doSometingAfterTimer() {
        if timerNumber > 0 {
            timerNumber -= 1
            timerSlider.value = Float(timerNumber)
            mainLabel.text = "⏰ \(timerNumber) 초"
        } else {
            timerNumber = 0
            mainLabel.text = "타이머 종료 ⏰"
            AudioServicesPlayAlertSound(SystemSoundID(1322))
            timer?.invalidate()
        }
    }
}

