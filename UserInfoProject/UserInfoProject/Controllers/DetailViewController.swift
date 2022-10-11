//
//  DetailViewController.swift
//  UserInfoProject
//
//  Created by 효우 on 2022/10/10.
//

import UIKit

final class DetailViewController: UIViewController {
    
    // MARK: - Property

    private let detailView = DetailView()
    var user: User? 
    
    // MARK: - LifeCycle

    
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupButtonAction()
    }
    
    // MARK: - Method
    
    private func setupData() {
        detailView.user = user
    }
    
    private func setupButtonAction() {
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
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
            
            let index = navigationController!.viewControllers.count - 2
            guard let vc = navigationController?.viewControllers[index] as? ViewController else { return }
            vc.userListManager.makeNewUser(newUser)
            
            //delegate?.addNewMember(newMember)
            } else {
            user?.userImage = detailView.mainImageView.image
            let userId = Int(detailView.userIdTextField.text!) ?? 0
            user?.name = detailView.nameTextField.text ?? ""
            user!.age = Int(detailView.ageTextField.text ?? "") ?? 0
            user!.phoneNumber = detailView.phoneNumberTextField.text ?? ""
            user!.address = detailView.addressTextField.text ?? ""
            detailView.user = user
            
            let index = navigationController!.viewControllers.count - 2
            guard let vc = navigationController?.viewControllers[index] as? ViewController else { return }
            vc.userListManager.updateUserInfo(index: userId, user!)
            
            //delegate?.update(index: memberId, member!)
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
}
