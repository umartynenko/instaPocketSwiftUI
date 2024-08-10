//
//  instaPocketSwiftUIApp.swift
//  instaPocketSwiftUI
//
//  Created by Юрий Мартыненко on 04.08.2024.
//

import SwiftUI


@main
struct instaPocketSwiftUIApp: App {
    @ObservedObject var pinCode = PinCode()
    
    init() {
//        UITabBar.appearance().backgroundColor = .clear
//        
//        let appearance = UITabBarAppearance()
//        appearance.configureWithTransparentBackground()
//        
//        
//        UITabBar.appearance().standardAppearance = appearance
//        
//        if #available(iOS 15.0, *) {
//            UITabBar.appearance().scrollEdgeAppearance = appearance
//        }
//        
//        
        UserDefaults.standard.setValue(false, forKey: "isAuthenticated")
    }
    
    var body: some Scene {
        WindowGroup {
            if UserDefaults.standard.bool(forKey: "isAuthenticated"){
                ContentView()
            } else {
                PasscodeView(pinCode: pinCode)
            }
        }
    }
}
