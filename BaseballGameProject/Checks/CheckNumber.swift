//
//  CheckNumber.swift
//  BaseballGameProject
//
//  Created by t2023-m0072 on 11/5/24.
//

import Foundation

class checkNumber { // 입력이 숫자인지 체크할 클래스
    func check(input: String) -> Bool {
        return Int(input) != nil // Int로 변환 가능하면 true, 변환 불가능하면(=문자가 있으면) false 반환
    }
}
