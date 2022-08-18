//
//  main.swift
//  UpAndDown
//
//  Created by 효우 on 2022/08/18.
//

import Foundation

var randomNumber = Int.random(in: 1...100)
var myNumber: Int = 0

while true {
    let userInputNumber = readLine()

    if let input = userInputNumber {
        if let number = Int(input) {
            myNumber = number
        }
    }
    
    if randomNumber > myNumber {
        print("UP")
    } else if randomNumber < myNumber {
        print("Down")
    } else {
        print("Bingo")
        break
    }
}
