//
//  BaseBallGame.swift
//  BaseballGameProject
//
//  Created by t2023-m0072 on 11/8/24.
//

import Foundation

class BaseballGame {
    func start() {
        makeAnswer()
    }
    
    func makeAnswer() -> [Int] {
        let arr = (1...9).map { $0 }
        let answer = arr.shuffled()[0...2]
        print(answer)
        return []
    }
}
