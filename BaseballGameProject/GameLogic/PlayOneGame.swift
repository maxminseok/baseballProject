//
//  PlayOneGame.swift
//  BaseballGameProject
//
//  Created by t2023-m0072 on 11/8/24.
//

import Foundation

class PlayGame {
    func playOneGame() -> Int {
        let makeAnswer = MakeAnswer()
        let answer = makeAnswer.makeAnswer() // 정답 생성
        
        var tryCount = 0 // 시도 횟수를 카운트 할 변수
        print("< 게임을 시작합니다 >")
        
        while true {
            print("숫자를 입력하세요")
            let input = readLine() ?? ""
            tryCount += 1 // 입력하면 시도 횟수 +1
            
            let inputArray = input.map { $0 }
            let inputStringArray = input.map { String($0) }
            
            let checkNegative = CheckCorrectInput().validateNegative(inputArray)
            let checkDuplicate = CheckCorrectInput().validateDuplicate(inputStringArray)
            
            guard checkNegative && checkDuplicate else { // 음수와 중복 입력 처리
                print("올바르지 않은 입력값 입니다\n")
                continue
            }
            
            let numberArray = input.compactMap { Int(String($0)) }// 숫자만 남기기
            
            let isValidate = CheckCorrectInput().validateInput(numberArray)
            guard isValidate else {
                print("올바르지 않은 입력값 입니다\n")
                continue // 이번 반복 종료, 다시 처음으로 돌아가 입력 받기
            }
            
            let strikeAndBall = StrikeAndBall().strikeAndBallCount(answer, numberArray) // 스트라이크와 볼 반환 받기
            
            if strikeAndBall.strike == 0 && strikeAndBall.ball == 0 {
                print("Nothing")
            } else if strikeAndBall.strike == 3 {
                print("정답입니다!")
                return tryCount// 정답일 경우 시도횟수 반환
            } else {
                print("\(strikeAndBall.strike)스트라이크 \(strikeAndBall.ball)볼")
            }
        }
    }
    
    func showGameLog(_ tryCountPerGame: [Int]) {
        if !tryCountPerGame.isEmpty { // 게임 기록이 있을 때만 기록 보이기
            print("< 게임 기록 보기 >")
            for (index,tryCount) in tryCountPerGame.enumerated() {
                print("\(index+1)번째 게임: 시도 횟수 - \(tryCount)")
            }
            print()
        } else { // 기록 없을 땐 재입력 안내 문구 띄우기
            let showMessage = ShowMessage()
            showMessage.showAgainSelectMessage()
            print()
        }
    }
}
