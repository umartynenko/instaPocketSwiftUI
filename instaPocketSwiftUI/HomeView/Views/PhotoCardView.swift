//
//  PhotoCardView.swift
//  instaPocketSwiftUI
//
//  Created by Юрий Мартыненко on 10.08.2024.
//

import SwiftUI

struct PhotoCardView: View {
    @State var image: String
    @State var isLiked: Bool = false
    
    var body: some View {
        let size = UIScreen.main.bounds.width - 60
        
        ZStack {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: size, height: size)
                .cornerRadius(30)
                .clipped()
            VStack(spacing: 149) {
                HStack {
                    Spacer()
                    Image(systemName: isLiked ? "heart.fill" : "heart" )
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                }
                VStack(spacing: 15) {
                    VStack(spacing: 8) {
                        HStack(spacing: 20){
                            Text("4 фотографии")
                            Text("2 комментария")
                            
                            Spacer()
                        }
                        .font(.system(size: 14, weight: .regular))
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0...4, id: \.self) { _ in
                                    Button {
                                        
                                    } label: {
                                        Text("Природа")
                                    }
                                    .font(.system(size: 14, weight: .regular))
                                    .padding(.horizontal, 20)
                                    .padding([.top, .bottom], 5)
                                    .background(Capsule().fill(.gray))
                                    .opacity(0.70)
                                }
                            }
                        }
                        .padding(.horizontal, -20)
                    }
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut ....")
                        .font(.system(size: 14, weight: .regular))
                        .lineLimit(3)
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    PhotoCardView(image: "brandon-atchison-jJFz-eAZhao-unsplash")
}
