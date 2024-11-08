//
//  MakeAnswer.swift
//  BaseballGameProject
//
//  Created by t2023-m0072 on 11/5/24.
//

import Foundation

class MakeAnswer {
    func makeAnswer() -> [Int] {
        let array = (1...9).map { $0 } // 0~9 사이 숫자 하나씩 배열에 저장
        let shuffledArray = array.shuffled() // 무작위로 섞기
        
        if shuffledArray[0] == 0 { // 첫번째에 0이 오도록 섞였을 때 동작
            return [Int](shuffledArray[1...3])
        } else {    // 첫번째가 0이 아닐 때 동작
            return [Int](shuffledArray[0...2])
        }
    }
}
