//
//  CheckCorrectInput.swift
//  BaseballGameProject
//
//  Created by t2023-m0072 on 11/5/24.
//

import Foundation

class CheckCorrectInput {
    
    func validateInput(_ input: [Int]) -> Bool {
        return input[0] != 0 && input.count == 3 // 입력이 3글자이고, 첫번째 글자가 0이 아닐때 true, 아니면 false 반환
    }
    
    func validateNegative(_ input: [String]) -> Bool { // 음수 처리
        return input[0] != "-" // 음수 입력이면 false 반환
    }
    
    func validateDuplicate(_ input: [String]) -> Bool { // 중복 처리
        return Set(input).count == input.count // Set에 넣었을때 갯수와 입력 배열의 갯수가 다를 때(=중복이 있을때) false 반환
    }
}
