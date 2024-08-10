//
//  HomeViewModel.swift
//  instaPocketSwiftUI
//
//  Created by Юрий Мартыненко on 10.08.2024.
//

import Foundation


class HomeViewModel: ObservableObject {
    @Published var posts: [PostData] = PostData.getMockData()

    func formattedDate(_ date: Date) -> String {
        let calendar = Calendar.current
        let twoDayAgo = calendar.date(byAdding: .day, value: -2, to: Date())!
        
        if calendar.isDateInToday(date) {
            return "Сегодня"
        } else if calendar.isDateInYesterday(date) {
            return "Вчера"
        } else if calendar.isDate(date, inSameDayAs: twoDayAgo) {
            return "2 дня назад"
        } else {
            let formatter = DateFormatter()
            formatter.dateStyle = .full
            formatter.locale = Locale(identifier: "ru_RU")
            
            return formatter.string(from: date)
        }
    }
}
