//
//  PinCode.swift
//  instaPocketSwiftUI
//
//  Created by Юрий Мартыненко on 04.08.2024.
//

import Foundation


class PinCode: ObservableObject {
    @Published var code: String = ""
    @Published var codeRepeat: String = ""
    @Published var isSettingPin: Bool = true
    @Published var isRepeatSettingPin: Bool = true
    @Published var isRepeatSettingPinValid: Bool = true
    @Published var isCodeValid: Bool = true
    @Published var isPinSet: Bool = false
    @Published var isAuthenticated: Bool = false
    
    private let pinCodeModel = PinCodeModel.self
    
    init() {
        if pinCodeModel.savePin != nil {
            isSettingPin = false
            isRepeatSettingPin = false
            isPinSet = true
        } else {
            isSettingPin = true
            isRepeatSettingPin = true
            isPinSet = false
        }
        
        isAuthenticated = pinCodeModel.isAuthenticated
    }
    
    func addDigit(_ digit: String) {
        if code.count < 4 {
            code.append(digit)
            if code.count == 4 {
                if isSettingPin {
                    setPin()
                } else if isRepeatSettingPin {
                    setPinRepeat()
                } else {
                    checkPin()
                }
            }
        }
    }
    
    func deleteDigit() {
        if !code.isEmpty {
            code.removeLast()
        }
    }
    
    private func setPin() {
        codeRepeat = code
        code = ""
        isSettingPin = false
        isPinSet = true
    }
    
    private func setPinRepeat() {
        if code == codeRepeat {
            pinCodeModel.savePin = code
            isRepeatSettingPin = false
            isPinSet = true
            isRepeatSettingPinValid = true
            code = ""
            codeRepeat = ""
        } else {
            isRepeatSettingPinValid = false
            code = ""
        }
    }
    
    private func checkPin() {
        if let savedPin = pinCodeModel.savePin, savedPin == code {
            isCodeValid = true
            isAuthenticated = true
            pinCodeModel.isAuthenticated = true
        } else {
            isCodeValid = false
            code = ""
        }
    }
}
