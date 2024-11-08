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
}
