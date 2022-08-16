//
//  ViewController.swift
//  MyFirstApp
//
//  Created by 효우 on 2022/08/16.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    @IBAction func didTapChangeTextLabel(_ sender: UIButton) {
        textLabel.text = "나의 첫번째 앱 얍얍"
    }
}

extension ViewController {
    func setUI() {
        textLabel.text = "안녕하세요"
        textLabel.textAlignment = .center
        textLabel.font = .systemFont(ofSize: 20, weight: .bold)
        
        textButton.titleLabel?.text = "나의 첫번째 앱"
        textButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        textButton.backgroundColor = .systemBlue
        textButton.tintColor = .white
    }
}
