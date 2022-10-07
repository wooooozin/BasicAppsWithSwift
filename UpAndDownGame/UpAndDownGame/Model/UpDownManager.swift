//
//  UpDownManager.swift
//  UpAndDownGame
//
//  Created by 효우 on 2022/10/07.
//

import Foundation

struct UpDownManager {
    private var randomNumber = Int.random(in: 1...10)
    private var myNumber: Int = 1
    
    mutating func resetNum() {
        randomNumber = Int.random(in: 1...10)
        myNumber = 1
    }
    
    mutating func setUsersNum(num: Int) {
        myNumber = num
    }
    
    func getUpDownResult() -> String {
        if randomNumber > myNumber {
            return "UP"
        } else if randomNumber < myNumber {
            return "DOWN"
        } else {
            return "BINGO! 😍"
        }
    }
}
