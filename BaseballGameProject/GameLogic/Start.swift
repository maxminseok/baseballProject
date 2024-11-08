//
//  Start.swift
//  BaseballGameProject
//
//  Created by t2023-m0072 on 11/8/24.
//

import Foundation

func start() {
    var tryCountPerGame: [Int] = []
    
    while true {
        let showMassage = ShowMessage()
        showMassage.showGreetingMessage()
        
        let option = readLine() ?? ""
        switch option {
        case "1":
            let tryCount = PlayGame().playOneGame()
            tryCountPerGame.append(tryCount)
        case "2":
            PlayGame().showGameLog(tryCountPerGame)
        case "3":
            print("< 숫자 야구 게임을 종료합니다 >")
            exit(0)
        default:
            print("올바른 숫자를 입력해주세요")
            print()
        }
    }
}
