//
//  main.swift
//  comandLineStudy1
//
//  Created by t2023-m0072 on 11/4/24.
//
import Foundation

/*                  출력 구현 부                  */
print("환영합니다! 원하시는 번호를 입력해주세요")
print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")

var gameSelect = readLine()!
var gameCount: [Int] = [] // 게임 카운트, index번째 게임의 시도횟수 tryCount를 추가하기 위한 배열

while gameSelect != "1" && gameSelect != "2" && gameSelect != "3" { // 입력이 1,2,3 아닐 경우 메세지 출력
    print ("1~3 사이의 숫자를 입력해주세요")
    gameSelect = readLine()!
}

while gameSelect != "3" { // 3일 경우 게임 종료, 1 or 2일 경우 아래 코드 동작
    var tryCount = 1 // 시도 횟수 카운트
    
    if gameSelect == "1" {  // 게임 선택에 대한 입력이 1일 경우 게임 시작
        print("게임을 시작합니다")
        print("숫자를 입력하세요")
        
        let answer = makeAnswer().makeAnswerArray() // 정답 생성
        let convert = convertNumber() // 배열로 변환할 인스턴스
        let StrikeAndBall = strikeAndBall() // 스트라이크를 체크할 인스턴스
        let CheckCorrectInput = checkCorrectInput() // 입력이 맞게 되었는지 확인할 인스턴스

        var inputNumber = readLine()!
        
        while !CheckCorrectInput.check(input: inputNumber) { // 입력에 이상 없는지 체크(3글자인지, 첫글자가 0 인지, 중복 있는지, 숫자 외 문자가 있는지)
            inputNumber = CheckCorrectInput.repeatInput() // 이상 있으면 없을 때까지 재입력
        }
        
        var inputArray = convert.convertArray(input: inputNumber) // 정답과 비교를 위해 입력 받은 값을 문자로 바꿔 배열에 저장
        
        var strikeAndBallCount = StrikeAndBall.check(answerArray: answer, inputArray: inputArray) // 스트라이크와 볼 판정
        print("\(strikeAndBallCount.strike)스트라이크 \(strikeAndBallCount.ball)볼") // 결과 출력
        
        while strikeAndBallCount.strike != 3 { // 스트라이크가 3개가 아니면 계속 반복
            print("\n숫자를 입력하세요")
            
            inputNumber = readLine()! // 숫자 재입력
            
            while !CheckCorrectInput.check(input: inputNumber) { // 다시 입력한 숫자에 문제 없는지 체크
                inputNumber = CheckCorrectInput.repeatInput() // 다시 입력한 숫자가 문제 없을 때까지 재입력
            }
            
            inputArray = convert.convertArray(input: inputNumber) // 재비교를 위해 다시 배열에 저장
            strikeAndBallCount = StrikeAndBall.check(answerArray: answer, inputArray: inputArray) // 다시 스트라이크 체크
            print("\(strikeAndBallCount.strike)스트라이크 \(strikeAndBallCount.ball)볼") // 재입력 결과 출력
            
            tryCount += 1 // 시도 횟수 증가
        }
        
        // 정답 맞춘 후 동작
        gameCount.append(tryCount) // 정답 맞춘 후 배열에 시도 횟수 추가
        
        print("정답입니다!")
        print("\n원하시는 번호를 입력해주세요")
        print("1. 게임 재시작하기  2. 게임 기록 보기  3. 종료하기")
        gameSelect = readLine()!
    }
    
    // 게임 기록이 있을 때 기록 확인 시 동작
    if gameSelect == "2" && !gameCount.isEmpty { // 기록 출력, 게임 기록이 있으면서 2가 눌렸을 때 동작
        for i in 1...gameCount.count {
            print("\(i)번째 게임 : 시도 횟수 - \(gameCount[i-1])") // 배열에 저장된 시도 횟수 출력
        }
        print("\n원하시는 번호를 입력해주세요")
        print("1. 게임 재시작하기  2. 게임 기록 보기  3. 종료하기")
        gameSelect = readLine()!
    }
    
    // 게임 기록이 없을 때 기록 확인 시 동작
    else if gameSelect == "2" && gameCount.isEmpty { // 2번 눌렀는데 게임 기록이 없을 때 동작
        print("아직 게임 기록이 없습니다")
        print("1. 게임 재시작하기  또는  3. 종료하기 를 입력해주세요")
        gameSelect = readLine()!
    }
    
    // 정답 맞춘 후 or 기록 확인 후 선택지 출력
    else if gameSelect != "1" && gameSelect != "2" && gameSelect != "3" { // 게임 기록 없을 때 1,2,3 이외의 입력이 들어올 때 동작
        print ("1~3 사이의 숫자를 입력해주세요")
        gameSelect = readLine()!
    }
}

print("숫자 야구 게임을 종료합니다")
