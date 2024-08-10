//
//  PasscodeView.swift
//  instaPocketSwiftUI
//
//  Created by Юрий Мартыненко on 04.08.2024.
//

import SwiftUI

struct PasscodeView: View {
    @StateObject var pinCode: PinCode
    
    var body: some View {
        VStack(spacing: 56) {
            if pinCode.isSettingPin {
                Text("Установите код")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.white)
            } else if  pinCode.isRepeatSettingPin {
                Text("Повторите код")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.white)
            } else {
                Text("Введите код")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.white)
            }
            
            HStack(spacing: 20) {
                ForEach(0..<4) { index in
                    Circle()
                        .stroke(Color.white, lineWidth: 3)
                        .background(Circle().foregroundColor(index < pinCode.code.count ? .white : .black))
                        .frame(width: 20, height: 20)
                }
            }
            .padding()
            
            VStack(alignment: .trailing, spacing: 20) {
                ForEach(0..<3) { row in
                    HStack(spacing: 20) {
                        ForEach(1..<4) { column in
                            let number = row * 3 + column
                            Button {
                                pinCode.addDigit("\(number)")
                            } label: {
                                Text("\(number)")
                                    .font(.system(size: 60, weight: .light))
                                    .frame(width: 80, height: 80)
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                }
                
                HStack(spacing: 20) {
                    Button {
                        pinCode.addDigit("0")
                    } label: {
                        Text("0")
                            .font(.system(size: 60, weight: .light))
                            .frame(width: 80, height: 80)
                            .foregroundStyle(.white)
                    }
                    
                    Button {
                        pinCode.deleteDigit()
                    } label: {
                        Image(systemName: "delete.left")
                            .font(.system(size: 30, weight: .light))
                            .frame(width: 80, height: 80)
                            .foregroundStyle(.white)
                    }
                }
            }
            
            if !pinCode.isRepeatSettingPinValid {
                Text("Коды не совпадают. Попробуйте снова.")
                    .foregroundColor(.red)
            } else if !pinCode.isCodeValid {
                Text("Неправильный код. Попробуйте снова.")
                    .foregroundColor(.red)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        
    }
}

#Preview {
    ContentView()
}
