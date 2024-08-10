//
//  HomeCollectionView.swift
//  instaPocketSwiftUI
//
//  Created by Юрий Мартыненко on 09.08.2024.
//

import SwiftUI

struct HomeCollectionView: View {
    @StateObject var getPost = HomeViewModel()
    
    @State private var lastOffset: CGFloat = 0
    @State private var currentOffset: CGFloat = 0
    @Binding var isScrollOffset: Bool
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            GeometryReader { position in
                Color.clear
                    .onAppear {
                        lastOffset = position.frame(in: .global).minY + 80
                    }
                    .onChange(of: position.frame(in: .global).minY) { newValue, oldValue in
                        currentOffset = newValue
                        if currentOffset > lastOffset {
                            isScrollOffset = false
                        } else if currentOffset < lastOffset {
                            isScrollOffset = true
                        }
                    }
            }
            
                LazyVStack(spacing: 30) {
                    ForEach(getPost.posts) { post in
                        VStack(alignment: .leading, spacing: 15) {
                            Text("\(getPost.formattedDate(post.date))")
                                .font(.system(size: 20, weight: .bold))
                            VStack(spacing: 30) {
                                ForEach(post.items) { item in
                                    ForEach(item.photos, id: \.self) { photo in
                                        PhotoCardView(image: photo, isLiked: item.isFavorite)
                                    }
                                }
                            }
                        }
                    }
                }
        }
    }
}

//#Preview {
//    HomeCollectionView()
//}
