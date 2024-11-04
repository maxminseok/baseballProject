//
//  main.swift
//  BaseballGameProject
//
//  Created by t2023-m0072 on 11/4/24.
//

// 숫자 문자로 변환 후 분리해서 배열에 저장하기
// 입력 받은 숫자도 문자로 변환 후 배열에 저장
// 정답 배열과 입력 배열이 같은지 확인, 스트라이크 카운트
// 같은 글자 수 - 스트라이크 수 = 볼 수
import Foundation

let answer = 628 // 정답
var answerArray: [String] = [] // 문자로 변환해 하나씩 저장할 예정

for char in String(answer) { // 문자열로 변환해 한글자씩 배열에 저장
    answerArray.append(String(char))
}

print("< 게임을 시작합니다 >")
print("숫자를 입력하세요")
var inputNumber = readLine()!

while Int(inputNumber) != answer { // 입력이 정답이랑 같은 값일때까지 반복
    var strike = 0
    var ball = 0
    var inputArray: [String] = [] // 입력을 한글자씩 배열에 저장할 예정
    
    if inputNumber.count == 3 && Int(inputNumber) != nil { // 입력이 3개이고 숫자인지 확인
        for char in inputNumber { // 입력한 숫자 한글자씩 배열에 저장
            inputArray.append(String(char))
        }
        // 정답 배열과 입력 배열이 같은지 확인
        for i in 0..<answerArray.count {
            if inputArray[i] == answerArray[i] { strike += 1 } // 스트라이크 카운트
        }
        ball = (answerArray.filter { inputArray.contains($0) }).count - strike // 교집합의 원소 수 센 다음 스트라이크만큼 뺀 수로 볼 카운트
        print("\(strike)스트라이크 \(ball)볼")
    }
    else { // 입력이 3자리가 아니거나 숫자가 아닐 경우
        if inputNumber.count != 3 { // 중에 세 자리가 아닌 경우
            print("세자리 숫자를 입력하세요.")
        } else { // 혹은 숫자가 아닌 글자가 포함된 경우
            print("숫자만 입력하세요")
        }
    }

    print()
    print("숫자를 입력하세요")
    inputNumber = readLine()!
}
print("정답입니다!")
