//
//  ShowMessage.swift
//  BaseballGameProject
//
//  Created by t2023-m0072 on 11/8/24.
//

import Foundation

class ShowMessage {
    func showGreetingMessage() {
        let greetingMessage = """
    환영합니다! 원하시는 번호를 입력해주세요
    1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기
    """
        print(greetingMessage)
    }
    
    func showAgainSelectMessage() {
        let seleceMessage = """
    아직 게임 기록이 없습니다
    게임 시작하기를 선택해 게임을 시작해보세요!
    """
        print(seleceMessage)
    }
}
