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
        textButton.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        textButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}
