//
//  DetailViewController.swift
//  SimpleTodoListProject
//
//  Created by 효우 on 2022/10/12.
//

import UIKit

final class DetailViewController: UIViewController {
    
    // MARK: - @IBOutlet
    
    
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var mainTextView: UITextView!
    
    @IBOutlet weak var saveButton: UIButton!
    
    // MARK: - Property
    
    lazy var buttons: [UIButton] = {
        return [redButton, greenButton, blueButton, purpleButton]
    }()
    
    let todoManager = CoreDataManager.shred
    var temporaryNum: Int64 = 1
    var todoData: MemoData? {
        didSet {
            temporaryNum = todoData?.color ?? 1
        }
    }

    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // 모든 버튼에 설정 변경
        buttons.forEach { button in
            button.clipsToBounds = true
            button.layer.cornerRadius = button.bounds.height / 2
        }
    }
    
    // MARK: - Actions
    @IBAction func colorButtonTapped(_ sender: UIButton) {
        self.temporaryNum = Int64(sender.tag)
        
        let color = MyColor(rawValue: Int64(sender.tag))
        setupColorTheme(color: color)
        
        clearButtonColors()
        setupColorButton(num: Int64(sender.tag))
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        if let todoData = self.todoData {
            todoData.memoText = mainTextView.text
            todoData.color = temporaryNum
            todoManager.updateToDo(newMemoData: todoData) {
                print("업데이트 완료")
                self.navigationController?.popViewController(animated: true)
            }
        } else {
            let memoText = mainTextView.text
            todoManager.saveMemoData(memoText: memoText, colorInt: temporaryNum) {
                print("저장완료")
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
}

extension DetailViewController {
    // MARK: - Method
    func setup() {
        mainTextView.delegate = self
        
        backGroundView.clipsToBounds = true
        backGroundView.layer.cornerRadius = 10
        
        saveButton.clipsToBounds = true
        saveButton.layer.cornerRadius = 8
        clearButtonColors()
    }
    
    func configureUI() {
        if let todoData = self.todoData {
            self.title = "메모 수정하기"
            
            guard let text = todoData.memoText else { return }
            mainTextView.text = text
            
            mainTextView.textColor = .black
            saveButton.setTitle("UPDATE", for: .normal)
            mainTextView.becomeFirstResponder()
            let color = MyColor(rawValue: todoData.color)
            setupColorTheme(color: color)
            } else {
            self.title = "새로운 메모 생성하기"
            
            mainTextView.text = "텍스트를 여기에 입력하세요."
            mainTextView.textColor = .lightGray
            setupColorTheme(color: .red)
        }
        setupColorButton(num: temporaryNum)
    }
    
    func setupColorTheme(color: MyColor? = .red) {
        backGroundView.backgroundColor = color?.backgoundColor
        saveButton.backgroundColor = color?.buttonColor
    }
    
    func clearButtonColors() {
        redButton.backgroundColor = MyColor.red.backgoundColor
        redButton.setTitleColor(MyColor.red.buttonColor, for: .normal)
        greenButton.backgroundColor = MyColor.green.backgoundColor
        greenButton.setTitleColor(MyColor.green.buttonColor, for: .normal)
        blueButton.backgroundColor = MyColor.blue.backgoundColor
        blueButton.setTitleColor(MyColor.blue.buttonColor, for: .normal)
        purpleButton.backgroundColor = MyColor.purple.backgoundColor
        purpleButton.setTitleColor(MyColor.purple.buttonColor, for: .normal)
    }
    
    func setupColorButton(num: Int64) {
        switch num {
        case 1:
            redButton.backgroundColor = MyColor.red.buttonColor
            redButton.setTitleColor(.white, for: .normal)
        case 2:
            greenButton.backgroundColor = MyColor.green.buttonColor
            greenButton.setTitleColor(.white, for: .normal)
        case 3:
            blueButton.backgroundColor = MyColor.blue.buttonColor
            blueButton.setTitleColor(.white, for: .normal)
        case 4:
            purpleButton.backgroundColor = MyColor.purple.buttonColor
            purpleButton.setTitleColor(.white, for: .normal)
        default:
            redButton.backgroundColor = MyColor.red.buttonColor
            redButton.setTitleColor(.white, for: .normal)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

// MARK: - UITextViewDelegate

extension DetailViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "텍스트를 여기에 입력하세요." {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = "텍스트를 여기에 입력하세요."
            textView.textColor = .lightGray
        }
    }
}
