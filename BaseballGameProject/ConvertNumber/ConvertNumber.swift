//
//  ConvertNumber.swift
//  BaseballGameProject
//
//  Created by t2023-m0072 on 11/5/24.
//

import Foundation

class convertNumber { // 한글자씩 문자로 배열에 저장하는 클래스
    func convertArray(input: String) -> [String] {
        var stringArray: [String] = []
        for char in input {
            stringArray.append(String(char))
        }
        return stringArray
    }
}
