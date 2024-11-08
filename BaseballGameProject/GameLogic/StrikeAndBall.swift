//
//  StrikeAndBall.swift
//  BaseballGameProject
//
//  Created by t2023-m0072 on 11/5/24.
//

import Foundation

class StrikeAndBall {
    func strikeAndBallCount(_ answerArray: [Int], _ inputArray: [Int]) -> (strike: Int, ball: Int) {
        var strike = 0
        var ball = 0
        
        for i in 0..<inputArray.count {
            if inputArray[i] == answerArray[i] { strike += 1 } // 스트라이크 카운트
        }
        ball = (answerArray.filter { inputArray.contains($0) }).count - strike // 교집합의 원소 수 센 다음 스트라이크 수만큼 뺀 수로 볼 카운트
        return (strike, ball)
    }
}

/*
 class strikeAndBall { // 스트라이크와 볼을 체크하는 클래스
 func check(answerArray: [String], inputArray: [String]) -> (strike: Int, ball: Int) {
 var strike = 0
 var ball = 0
 for i in 0..<inputArray.count {
 if inputArray[i] == answerArray[i] { strike += 1 } // 스트라이크 카운트
 }
 ball = (answerArray.filter { inputArray.contains($0) }).count - strike // 교집합의 원소 수 센 다음 스트라이크만큼 뺀 수로 볼 카운트
 return (strike, ball)
 }
 }
 */
