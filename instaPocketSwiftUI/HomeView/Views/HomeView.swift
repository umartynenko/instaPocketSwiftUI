import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 0
    @State var isScrollOffset: Bool = false
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    init() {
        UITabBar.appearance().backgroundColor = .clear
        
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        
        
        UITabBar.appearance().standardAppearance = appearance
        
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    // Определение ориентации экрана
    var isLandscape: Bool {
        horizontalSizeClass == .regular || verticalSizeClass == .compact
    }
    
    // Смещение кнопки в зависимости от ориентации экрана
    var buttonOffset: CGFloat {
        isLandscape ? -10 : -35
    }
    
    var fontSize: CGFloat {
        isScrollOffset ? 20 : 30
    }
    
    var fontSizeImage: CGFloat {
        isScrollOffset ? 15 : 25
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("instaPoket")
                    .font(.system(size: fontSize, weight: .bold))
                    .foregroundColor(.white)
                    .animation(.easeInOut(duration: 1), value: fontSize)
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "gearshape")
                        .font(.system(size: fontSizeImage))
                        .animation(.easeInOut(duration: 1), value: fontSizeImage)
                }
                .foregroundColor(.white)
            }
            
            ZStack {
                TabView(selection: $selectedTab) {
                    HomeCollectionView(isScrollOffset: $isScrollOffset)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .background(.black)
                        .tag(0)
                    
                    //                ScrollView {
                    //                    ForEach(viewModel.secondTabItems, id: \.self) { item in
                    //                        Text(item)
                    //                            .foregroundStyle(.red)
                    //                    }
                    //                }
                    //                .frame(maxWidth: .infinity)
                    //                .background(.black)
                    //                .tag(1)
                }
                .frame(maxWidth: .infinity)
                .accentColor(.white)
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.gray)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 2)
                                )
                        }
                        //                    .offset(y: buttonOffset)
                        
                        Spacer()
                    }
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            selectedTab = 0
                        }) {
                            ZStack {
                                Circle()
                                    .foregroundColor(.gray)
                                    .frame(width: 40, height: 40)
                                
                                Image(systemName: "house.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                    .padding()
                                    .clipShape(Circle())
                                    .shadow(radius: 4)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.white, lineWidth: 2)
                                            .frame(width: 40, height: 40)
                                    )
                            }
                        }
                        .frame(maxWidth: .infinity)
                        //                    .offset(y: buttonOffset)
                        
                        Spacer(minLength: 100)
                        
                        Button(action: {
                            selectedTab = 1
                        }) {
                            ZStack {
                                Circle()
                                    .foregroundColor(.gray)
                                    .frame(width: 40, height: 40)
                                Image(systemName: "heart.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                    .padding()
                                    .shadow(radius: 4)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.white, lineWidth: 2)
                                            .frame(width: 40, height: 40)
                                    )
                            }
                        }
                        .frame(maxWidth: .infinity)
                        //                    .offset(y: buttonOffset)
                        
                        Spacer()
                    }
                }
            }
            .frame(width: .infinity, height: .infinity, alignment: .center)
        }
    }
}


//struct ScrollOffsetPreferenceKey: PreferenceKey {
//    static var defaultValue: CGFloat = 0
//    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
//        value = nextValue()
//    }
//}


#Preview {
    ContentView()
}
