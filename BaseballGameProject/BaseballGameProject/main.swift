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

class makeAnswer { // 정답으로 할 3자리 랜덤 난수 생성 클래스
    func randomAnswer() -> String {
        return String(Int.random(in: 100...999))
    }
}

class convertNumber { // 한글자씩 문자로 배열에 저장하는 클래스
    func convertArray(input: String) -> [String] {
        var stringArray: [String] = []
        for char in input {
            stringArray.append(String(char))
        }
        return stringArray
    }
}

class checkNumber { // 입력이 숫자인지 체크할 클래스
    func check(input: String) -> Bool {
        return Int(input) == nil // Int로 변환 가능하면 false, 변환 불가능하면(=문자가 있으면) true 반환
    }
}

class checkThree { // 3글자인지 체크하는 클래스
    func check(input: String) -> Bool {
        return input.count != 3 // 3글자 일때 false, 3글자가 아닐때 false 반환
    }
}

class checkZero { // 숫자에 0이 있는지 체크하는 클래스
    func check(input: [String]) -> Bool {
        return input.contains("0") // 0이 있으면 true 반환, 없으면 false 반환
    }
}

class checkDuplication { // 중복 있는지 체크하는 클래스
    func check(input: [String]) -> Bool {
        return Set(input).count != input.count // 입력으로 들어온 배열을 카운트한 값과 Set으로 넣고 카운트한 값이 다르면(=중복이 있으면) true 반환, 같으면(=중복이 없으면) false 반환
    }
}

class checkStrike { // 스트라이크/볼 체크하는 클래스
    func check(answerArray: [String], inputArray: [String]) -> Int {
        var strike = 0
        var ball = 0
        for i in 0..<inputArray.count {
            if inputArray[i] == answerArray[i] { strike += 1 } // 스트라이크 카운트
        }
        ball = (answerArray.filter { inputArray.contains($0) }).count - strike // 교집합의 원소 수 센 다음 스트라이크만큼 뺀 수로 볼 카운트
        print("\(strike)스트라이크 \(ball)볼")
        return strike
    }
}

class checkCorrectInput { // 입력이 제대로 됐는지 확인하는 클래스
    var CheckNumber: checkNumber
    var CheckZero: checkZero
    var CheckDuplication: checkDuplication
    var CheckThree: checkThree
    var ConvertNumber: convertNumber
    
    init() {
        self.CheckNumber = checkNumber()
        self.CheckZero = checkZero()
        self.CheckDuplication = checkDuplication()
        self.CheckThree = checkThree()
        self.ConvertNumber = convertNumber()
    }
    func check(input: String) -> Bool { // 3글자이면서, 0이 없고, 중복도 없고, 숫자만 입력되었을때 true, 아니면 false
        let arr = ConvertNumber.convertArray(input: input)
        return CheckNumber.check(input: input) || CheckZero.check(input: arr) || CheckDuplication.check(input: arr) || CheckThree.check(input: input)
    }
    func repeatInput() -> String {
        print("숫자만 3자리로 다시 입력해주세요")
        var inputNumber = readLine()!
        while check(input: inputNumber) {
            print("숫자만 3자리로 다시 입력해주세요")
            inputNumber = readLine()!
        }
        return inputNumber
    }
}


/*                  출력 구현 부                 */

var answer = makeAnswer().randomAnswer() // 정답 숫자
let convert = convertNumber() // 배열로 변환할 인스턴스
let CheckNumber = checkNumber() // 숫자인지 체크할 인스턴스
let CheckZero = checkZero() // 0 있는지 체크할 인스턴스
let CheckDup = checkDuplication() // 중복 체크할 인스턴스
let CheckThree = checkThree() // 3글자인지 체크할 인스턴스
let CheckStrike = checkStrike() // 스트라이크를 체크할 인스턴스
var CheckCorrectInput = checkCorrectInput() // 입력이 맞게 되었는지 확인할 인스턴스

var answerArray = convert.convertArray(input: answer) // 정답 숫자 문자로 변환 후 배열에 저장
while CheckZero.check(input: answerArray) || CheckDup.check(input: answerArray) { // 0과 중복 둘 중 하나라도 있으면 정답 재설정
    answer = makeAnswer().randomAnswer()
    answerArray = convert.convertArray(input: answer)
}


print("< 게임을 시작합니다 >")
print("숫자를 입력하세요")

var inputNumber = readLine()!
while CheckCorrectInput.check(input: inputNumber) { // 입력에 이상 없는지 체크 후 이상 있으면 재입력
    inputNumber = CheckCorrectInput.repeatInput()
}

var inputArray = convert.convertArray(input: inputNumber) // 비교를 위해 문자로 바꿔 배열 입력
var checkStrikeCount = CheckStrike.check(answerArray: answerArray, inputArray: inputArray) // 볼&스트라이크 판별

while checkStrikeCount != 3 { // 스트라이크가 3개가 아니면 계속 반복
    print()
    print("숫자를 입력하세요")
    inputNumber = readLine()! // 숫자 재입력
    while CheckCorrectInput.check(input: inputNumber) { // 다시 입력한 숫자에 문제 없는지 체크
        inputNumber = CheckCorrectInput.repeatInput()
    }
    inputArray = convert.convertArray(input: inputNumber) // 재비교를 위해 다시 배열에 저장
    checkStrikeCount = CheckStrike.check(answerArray: answerArray, inputArray: inputArray) // 다시 스트라이크 체크
}
print("정답입니다!")

/*
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
*/
