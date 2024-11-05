//
//  CheckCorrectInput.swift
//  BaseballGameProject
//
//  Created by t2023-m0072 on 11/5/24.
//

import Foundation

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
        
        print("checknumber: \(CheckNumber.check(input: input))")
        print("checkzero: \(CheckZero.check(input: arr))")
        print("checkDup: \(CheckDuplication.check(input: arr))")
        print("CheckThree: \(CheckThree.check(input: input))")
        print(CheckNumber.check(input: input) && CheckZero.check(input: arr) && CheckDuplication.check(input: arr) && CheckThree.check(input: input))
        
        return CheckNumber.check(input: input) && CheckZero.check(input: arr) && CheckDuplication.check(input: arr) && CheckThree.check(input: input)
    }
    func repeatInput() -> String { // 정확한 숫자가 입력될 때까지 반복
        print("숫자만 3자리로 다시 입력해주세요")
        var inputNumber = readLine()!
        while !check(input: inputNumber) { // check 메서드가 true를 반환할때까지 반복
            print("숫자만 3자리로 다시 입력해주세요")
            inputNumber = readLine()!
        }
        return inputNumber
    }
}
