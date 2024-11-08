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

/*
class makeAnswer { // 정답으로 할 3자리 랜덤 난수 생성 클래스
    let convert = convertNumber() // 배열로 변환할 인스턴스
    let CheckZero = checkZero() // 0 있는지 체크할 인스턴스
    let CheckDup = checkDuplication() // 중복 체크할 인스턴스

    func randomAnswer() -> String { // 난수 생성 메서드
        return String(Int.random(in: 100...999)) // 난수를 String 타입으로 형변환 해서 반환
    }

    func makeAnswerArray() -> [String] { // 정답 생성 메서드
        var answer = randomAnswer() // 난수 생성
        var answerArray = convert.convertArray(input: answer) // 정답 숫자를 문자로 변환 후 배열에 저장
        
        while !CheckZero.check(input: answerArray) || !CheckDup.check(input: answerArray) { // 정답 글자의 중복 여부와 첫글자 0 유무 확인, 둘 중 하나라도 있으면 정답 재설정
            answer = randomAnswer()
            answerArray = convert.convertArray(input: answer)
        }
        return answerArray // 정답이 저장된 배열 반환
    }
}
*/
