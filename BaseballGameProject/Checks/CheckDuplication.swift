//
//  CheckDuplication.swift
//  BaseballGameProject
//
//  Created by t2023-m0072 on 11/5/24.
//

import Foundation

class checkDuplication { // 중복 있는지 체크하는 클래스
    func check(input: [String]) -> Bool {
        return Set(input).count == input.count // 입력으로 들어온 배열을 카운트한 값과, Set으로 넣고 카운트한 값이 다르면(=중복이 있으면) false 반환, 같으면(=중복이 없으면) true 반환
    }
}
