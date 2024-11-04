//
//  main.swift
//  comandLineStudy1
//
//  Created by t2023-m0072 on 11/4/24.
//
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

class checkZero { // 첫번째 자리에 0이 있는지 체크하는 클래스
    func check(input: [String]) -> Bool {
        return input.first == "0" //첫번째 자리에 0이 있으면 true 반환, 없으면 false 반환
    }
}

class checkDuplication { // 중복 있는지 체크하는 클래스
    func check(input: [String]) -> Bool {
        return Set(input).count != input.count // 입력으로 들어온 배열을 카운트한 값과 Set으로 넣고 카운트한 값이 다르면(=중복이 있으면) true 반환, 같으면(=중복이 없으면) false 반환
    }
}

class checkStrike { // 스트라이크/볼 체크하는 클래스
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
    func check(input: String) -> Bool { // 3글자이면서, 첫번째 자리가 0이 아니고, 중복도 없고, 숫자만 입력 되었을때 true, 아니면 false 반환
        let arr = ConvertNumber.convertArray(input: input)
        return CheckNumber.check(input: input) || CheckZero.check(input: arr) || CheckDuplication.check(input: arr) || CheckThree.check(input: input)
    }
    func repeatInput() -> String { // 정확한 숫자가 입력될 때까지 반복
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
print("환영합니다! 원하시는 번호를 입력해주세요")
print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
var gameSelect = readLine()!
var gameCount: [Int] = [] // 게임 카운트, index번째 게임의 시도횟수 tryCount를 추가하기 위한 배열
if gameSelect != "1" && gameSelect != "2" && gameSelect != "3" { print ("1~3 사이의 숫자를 입력해주세요")} // 입력이 1,2,3 아닐 경우 메세지 출력, 1~3 아닌 숫자일 때 재입력 코드 필요
else {
    while gameSelect != "3" { // 3일 경우 게임 종료, 1,2일 경우 아래 코드 동작
        var tryCount = 0 // 시도 횟수 카운트
        if gameSelect == "1" { // 1일 경우 게임 시작
            print("게임을 시작합니다")
            print("숫자를 입력하세요")
            
            var answer = makeAnswer().randomAnswer() // 정답 숫자
            let convert = convertNumber() // 배열로 변환할 인스턴스
            let CheckZero = checkZero() // 0 있는지 체크할 인스턴스
            let CheckDup = checkDuplication() // 중복 체크할 인스턴스
            let CheckStrike = checkStrike() // 스트라이크를 체크할 인스턴스
            let CheckCorrectInput = checkCorrectInput() // 입력이 맞게 되었는지 확인할 인스턴스
            
            var answerArray = convert.convertArray(input: answer) // 정답 숫자를 문자로 변환 후 배열에 저장
            while CheckZero.check(input: answerArray) || CheckDup.check(input: answerArray) { // 정답 글자의 중복 여부와 첫글자 0 유무 확인, 둘 중 하나라도 있으면 정답 재설정
                answer = makeAnswer().randomAnswer()
                answerArray = convert.convertArray(input: answer)
            }
            
            var inputNumber = readLine()!
            while CheckCorrectInput.check(input: inputNumber) { // 입력에 이상 없는지 체크
                inputNumber = CheckCorrectInput.repeatInput() // 이상 있으면 없을때까지 재입력
            }
            
            var inputArray = convert.convertArray(input: inputNumber) // 비교를 위해 문자로 바꿔 배열에 저장
            var checkStrikeCount = CheckStrike.check(answerArray: answerArray, inputArray: inputArray) // 볼&스트라이크 판별
            print("\(checkStrikeCount.strike)스트라이크 \(checkStrikeCount.ball)볼")
            
            while checkStrikeCount.strike != 3 { // 스트라이크가 3개가 아니면 계속 반복
                print("\n숫자를 입력하세요")
                inputNumber = readLine()! // 숫자 재입력
                while CheckCorrectInput.check(input: inputNumber) { // 다시 입력한 숫자에 문제 없는지 체크
                    inputNumber = CheckCorrectInput.repeatInput() // 다시 입력한 숫자가 문제 없을떄까지 재입력
                }
                inputArray = convert.convertArray(input: inputNumber) // 재비교를 위해 다시 배열에 저장
                checkStrikeCount = CheckStrike.check(answerArray: answerArray, inputArray: inputArray) // 다시 스트라이크 체크
                print("\(checkStrikeCount.strike)스트라이크 \(checkStrikeCount.ball)볼")
                tryCount += 1 // 시도 횟수 증가
            }
            
            gameCount.append(tryCount) // 정답 맞춘 후 배열에 시도 횟수 추가
            print("정답입니다!")
            print("\n원하시는 번호를 입력해주세요")
            print("1. 게임 재시작하기  2. 게임 기록 보기  3. 종료하기")
            gameSelect = readLine()!
        }
            if gameSelect == "2" { // 기록 출력, 게임 횟수 0일때 예외처리 필요
                for i in 1...gameCount.count {
                    print("\(i)번째 게임 : 시도 횟수 - \(gameCount[i-1])") // 배열에 저장된 시도 횟수 출력
                }
                print("\n원하시는 번호를 입력해주세요")
                print("1. 게임 재시작하기  2. 게임 기록 보기  3. 종료하기")
                gameSelect = readLine()!
            }
        }
    print("숫자 야구 게임을 종료합니다")
    }

