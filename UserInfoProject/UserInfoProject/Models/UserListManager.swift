//
//  UserListManager.swift
//  UserInfoProject
//
//  Created by 효우 on 2022/10/09.
//

import Foundation

final class UserListManager {
    private var userList: [User] = []
    
    func makeUserListData() {
        userList = [
            User(name: "홍길동", age: 20, phoneNumber: "010-1111-2222", address: "서울"),
            User(name: "임꺽정", age: 23, phoneNumber: "010-2222-3333", address: "서울"),
            User(name: "스티브", age: 50, phoneNumber: "010-1234-1234", address: "미국"),
            User(name: "쿡", age: 30, phoneNumber: "010-7777-7777", address: "캘리포니아"),
            User(name: "베조스", age: 50, phoneNumber: "010-2222-7777", address: "하와이"),
            User(name: "배트맨", age: 40, phoneNumber: "010-3333-1234", address: "고담씨티"),
            User(name: "조커", age: 40, phoneNumber: "010-4321-1234", address: "고담씨티")
        ]
    }
    
    func getUserList() -> [User] {
        return userList
    }
    
    func makeNewUser(_ user: User) {
        userList.append(user)
    }
    
    func updateUserInfo(index: Int, _ user: User) {
        userList[index] = user
    }
    
    subscript(index: Int) -> User {
        get {
            return userList[index]
        }
    }
}
