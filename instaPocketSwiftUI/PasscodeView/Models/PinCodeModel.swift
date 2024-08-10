//
//  PinCodeModel.swift
//  instaPocketSwiftUI
//
//  Created by Юрий Мартыненко on 10.08.2024.
//

import Foundation


struct PinCodeModel {
    static var savePin: String? {
        get {
            UserDefaults.standard.string(forKey: "savePin")
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "savePin")
        }
    }
    
    static var isAuthenticated: Bool {
        get {
            UserDefaults.standard.bool(forKey: "isAuthenticated")
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "isAuthenticated")
        }
    }
}
