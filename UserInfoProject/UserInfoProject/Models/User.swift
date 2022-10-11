//
//  User.swift
//  UserInfoProject
//
//  Created by 효우 on 2022/10/09.
//

import UIKit

struct User {
    lazy var userImage: UIImage? = {
        guard let name = name else {
            return UIImage(systemName: "person")
        }
        return UIImage(named: "\(name).png") ?? UIImage(systemName: "person")
    }()
    
    static var memberNumber: Int = 0
    
    let userId: Int
    var name: String?
    var age: Int?
    var phoneNumber: String?
    var address: String?
    
    init(name: String?, age: Int?, phoneNumber: String?, address: String?) {
        self.userId = Self.memberNumber
        self.name = name
        self.age = age
        self.phoneNumber = phoneNumber
        self.address = address
        
        Self.memberNumber += 1
    }
}
