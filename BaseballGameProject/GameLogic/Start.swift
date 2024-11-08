//
//  Start.swift
//  BaseballGameProject
//
//  Created by t2023-m0072 on 11/8/24.
//

import Foundation

class GameStart {
    func start() {
        var tryCountPerGame: [Int] = []
        var proceed = true
        
        while proceed {
            let showMassage = ShowMessage()
            showMassage.showGreetingMessage() // 첫 문구 출력
            
            let option = readLine() ?? ""
            switch option {
            case "1":
                let tryCount = PlayGame().playOneGame()
                tryCountPerGame.append(tryCount)
            case "2":
                PlayGame().showGameLog(tryCountPerGame)
            case "3":
                print("< 숫자 야구 게임을 종료합니다 >")
                proceed = false
            default:
                print("올바른 숫자를 입력해주세요")
                print()
            }
        }
    }
}
