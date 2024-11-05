//
//  CheckZero.swift
//  BaseballGameProject
//
//  Created by t2023-m0072 on 11/5/24.
//

import Foundation

class checkZero { // 첫번째 자리에 0이 있는지 체크하는 클래스
    func check(input: [String]) -> Bool {
        return input.first == "0" //첫번째 자리에 0이 있으면 true 반환, 없으면 false 반환
    }
}
