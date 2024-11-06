//
//  CheckNegative.swift
//  BaseballGameProject
//
//  Created by t2023-m0072 on 11/6/24.
//

import Foundation

class checkNegative { // 음수인지 체크하는 클래스
    func check(input: String) -> Bool {
        return !input.contains("-") // 마이너스 기호가 있으면 false, 없으면 true 반환
    }
}
