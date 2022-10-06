//
//  ResultViewController.swift
//  BMI
//
//  Created by 효우 on 2022/10/06.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: - Properties

    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var bmiResult: Double?
    var adviceText: String?
    var bmiColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    // MARK: - Actions
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}

// MARK: - Methods

extension ResultViewController {
    func makeUI() {
        bmiNumberLabel.layer.cornerRadius = 8
        bmiNumberLabel.backgroundColor = .systemGray5
        
        backButton.layer.cornerRadius = 5
        backButton.clipsToBounds = true
        backButton.setTitle("다시 계산하기", for: .normal)
        
        guard let bmi = bmiResult else { return }
        bmiNumberLabel.text = String(bmi)
        resultLabel.text = adviceText
        resultLabel.backgroundColor = bmiColor
    }
}
