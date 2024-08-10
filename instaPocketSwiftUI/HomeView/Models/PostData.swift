//
//  PostData.swift
//  instaPocketSwiftUI
//
//  Created by Юрий Мартыненко on 09.08.2024.
//

import Foundation


struct PostData: Identifiable {
    let id = UUID().uuidString
    let items: [PostItem]
    var date: Date
    
    static func getMockData() -> [PostData] {
        [
            PostData(items:
                        [
                            PostItem(photos:
                                        [
                                            "samsung-memory--ZxbG3hF9Zs-unsplash",
                                            "samsung-memory-6RcDLyy0s1I-unsplash",
                                            "samsung-memory-TBe4XLF29kk-unsplash"
                                        ],
                                     commets: nil,
                                     tags:
                                        [
                                            "Indoors",
                                            "Interior Design",
                                            "Table",
                                            "Furniture",
                                            "Wallet",
                                            "Accessories",
                                            "Accessory",
                                            "Video Gaming",
                                            "Creative Commons Images"
                                        ],
                                     description: "Memory for every endeavor – get fast storage solutions that work seamlessly with your devices.",
                                     isFavorite: false),
                            PostItem(photos:
                                        [
                                            "lasse-jensen-GvBFNyMdr7g-unsplash",
                                            "lasse-jensen-YhKpsFyH4AY-unsplash",
                                            "lasse-jensen-zOlroafBElA-unsplash"
                                        ],
                                     commets: nil,
                                     tags:
                                        [
                                            "Lifestyle",
                                            "Scandinavian",
                                            "Product Photography",
                                            "Workspace",
                                            "Brand"
                                        ],
                                     description: "Copenhagen-based photographer focusing on brand and lifestyle content. Visit my website for more info",
                                     isFavorite: false),
                            PostItem(photos:
                                        [
                                            "brandon-atchison-jJFz-eAZhao-unsplash",
                                            "brandon-atchison-LZkkrfKp29c-unsplash",
                                            "brandon-atchison-VmYXPEadinY-unsplash"
                                        ],
                                     commets: nil,
                                     tags:
                                        [
                                            "Car Images & Pictures",
                                            "Portraits",
                                            "Travel Images",
                                            "Cameras",
                                            "Nature Images"
                                        ],
                                     description: "Enjoy my images guys!❤️✌🏾 Feel free to follow me on Instagram @brandonsbliss",
                                     isFavorite: false)
                        ],
                     date: Date()),
            PostData(items:
                        [
                            PostItem(photos:
                                        [
                                            "jonny-gios-AQrX6XwnTBE-unsplash",
                                            "jonny-gios-BGfdzrGPqGk-unsplash",
                                            "jonny-gios-ZYRbh2BD0mE-unsplash"
                                        ],
                                     commets: nil,
                                     tags:
                                        [
                                            "Lake District",
                                            "Cumbria",
                                            "Sunrise",
                                            "Community",
                                            "Jonny Gios"
                                        ],
                                     description: "Always looking for the next adventure to capture the next shot. Seize the day. Sony A7 IV . There are more images behind my Unsplash, for commercial projects please contact me. John 3:16",
                                     isFavorite: true),
                            PostItem(photos:
                                        [
                                            "jose-figueroa-0z16ael-uAk-unsplash",
                                            "jose-figueroa-ht33TTiBsEY-unsplash",
                                            "jose-figueroa-WaoRDFSYQ9g-unsplash"
                                        ],
                                     commets: nil,
                                     tags:
                                        [
                                            "Nature Images",
                                            "Film",
                                            "Portraits",
                                            "Travel Images",
                                            "People Images & Pictures"
                                        ],
                                     description: "Download free, beautiful high-quality photos curated by Jose.",
                                     isFavorite: true)
                        ],
                     date: Date().addingTimeInterval(-86_400)),
            PostData(items:
                        [
                            PostItem(photos:
                                        [
                                            "patrick-konior-ajjg1T5nCWE-unsplash",
                                            "patrick-konior-XlFBK9AQcmg-unsplash",
                                            "patrick-konior-Y-LE9iyx0RE-unsplash"
                                        ],
                                     commets: nil,
                                     tags:
                                        [
                                            "Filmmaking",
                                            "Automotive",
                                            "Outdoors",
                                            "Cinematic"
                                        ],
                                     description: "Just snappin every day life.",
                                     isFavorite: true),
                            PostItem(photos:
                                        [
                                            "alex-tyson-dxtbeUD96cA-unsplash",
                                            "alex-tyson-oE0I7zOy1-c-unsplash",
                                            "alex-tyson-XPn4g12YBKM-unsplash"
                                        ],
                                     commets: nil,
                                     tags:
                                        [
                                            "Flower Images",
                                            "Plant",
                                            "Real Estate",
                                            "Home"
                                        ],
                                     description: "\"Enjoy what you are shooting\" Alex",
                                     isFavorite: false)
                        ],
                     date: Date().addingTimeInterval(-172_800))
        ]
    }
    
}


struct PostItem: Identifiable {
    let id = UUID().uuidString
    let photos: [String]
    let commets: [Comment]?
    let tags: [String]?
    let description: String?
    
    var isFavorite: Bool = false
}


struct Comment: Identifiable {
    let id = UUID().uuidString
    let date: Date
    let comment: String
}
