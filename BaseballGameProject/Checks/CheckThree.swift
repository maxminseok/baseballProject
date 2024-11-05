//
//  CheckThree.swift
//  BaseballGameProject
//
//  Created by t2023-m0072 on 11/5/24.
//

import Foundation

class checkThree { // 3글자인지 체크하는 클래스
    func check(input: String) -> Bool {
        return input.count == 3 // 3글자여야 하므로 3글자 일때 true, 3글자가 아닐때 false 반환
    }
}
