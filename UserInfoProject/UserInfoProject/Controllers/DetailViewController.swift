//
//  DetailViewController.swift
//  UserInfoProject
//
//  Created by 효우 on 2022/10/10.
//

import UIKit
import PhotosUI

final class DetailViewController: UIViewController {
    
    // MARK: - Property

    private let detailView = DetailView()
    var user: User?
    weak var delegate: UserDelegate?
    
    // MARK: - LifeCycle

    
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupButtonAction()
        setupTapGestures()
    }
    
    // MARK: - Method
    
    private func setupData() {
        detailView.user = user
    }
    
    private func setupButtonAction() {
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    private func setupTapGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpImageView))
        detailView.mainImageView.addGestureRecognizer(tapGesture)
        detailView.mainImageView.isUserInteractionEnabled = true
    }
    
    @objc func touchUpImageView() {
        print(#function)
        setupImagePicker()
    }
    
    private func setupImagePicker() {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 0
        configuration.filter = .any(of: [.images, .videos])
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    @objc func saveButtonTapped() {
        print(#function)
        
        if user == nil {
            let name = detailView.nameTextField.text ?? ""
            let age = Int(detailView.ageTextField.text ?? "")
            let phoneNumber = detailView.phoneNumberTextField.text ?? ""
            let address = detailView.addressTextField.text ?? ""
            
            let newUser =
            User(name: name, age: age, phoneNumber: phoneNumber, address: address)
            user?.userImage = detailView.mainImageView.image
            
//            let index = navigationController!.viewControllers.count - 2
//            guard let vc = navigationController?.viewControllers[index] as? ViewController else { return }
//            vc.userListManager.makeNewUser(newUser)
            
            delegate?.addNewUser(newUser)
            
            } else {
            user?.userImage = detailView.mainImageView.image
            let userId = Int(detailView.userIdTextField.text!) ?? 0
            user?.name = detailView.nameTextField.text ?? ""
            user!.age = Int(detailView.ageTextField.text ?? "") ?? 0
            user!.phoneNumber = detailView.phoneNumberTextField.text ?? ""
            user!.address = detailView.addressTextField.text ?? ""
            detailView.user = user
            
//            let index = navigationController!.viewControllers.count - 2
//            guard let vc = navigationController?.viewControllers[index] as? ViewController else { return }
//            vc.userListManager.updateUserInfo(index: userId, user!)
            
            delegate?.updateUser(index: userId, user!)
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
}

// MARK: - PHPickerViewControllerDelegate

extension DetailViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        let itemProvider = results.first?.itemProvider
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                DispatchQueue.main.async {
                    self.detailView.mainImageView.image = image as? UIImage
                }
            }
        } else {
            print("이미지 로드 실패")
        }
    }
}
