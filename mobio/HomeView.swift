//
//  Home.swift
//  mobio
//
//  Created by Oyatullo Koraboev on 16/06/23.
//

import SwiftUI
struct HomeView: View {
    @State private var isSideBarOpened: Bool = false
    @State private var currentSection: Section = .home
    
    @EnvironmentObject var profile: Profile
    let tokenService = UserDefaultsManager()
    
    var body: some View {
        ZStack {
            Color.gray
                .edgesIgnoringSafeArea(.all)
            if isSideBarOpened {
                Color.black.opacity(0.45)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isSideBarOpened.toggle()
                    }
                    .zIndex(1)
            }
            
            NavigationView {
                ZStack {
                    VStack{
                        switch currentSection {
                        case .home:
                            MainHomeView()
                        case .search:
                            Text("Welcome to Search")
                        case .basket:
                            Text("Welcome to Basket")
                        case .glavnieOkno:
                            Text("Welcome to glavnieOkno")
                        case .departments:
                            Text("Welcome to departments")
                        case .izobrajenie:
                            Text("Welcome to izobrajenie")
                        case .voprosi:
                            Text("Welcome to voprosi")
                        case .vetvi:
                            Text("Welcome to vetvi")
                        case .nastroyki:
                            Text("Welcome to nastroyki")
                        }
                        //                        GridCircleView()
                        
                    }
                    TabbarView(selectedSection: $currentSection)
                        .background(Color.white)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                }
                .ignoresSafeArea()
                .background(Color.gray.opacity(0.05))
                .navigationBarTitle("Home", displayMode: .inline)
                .navigationBarItems(
                    leading: Button(action: {
                        isSideBarOpened.toggle()
                    }) {
                        Image(systemName: "gearshape")
                            .foregroundColor(Color.pink)
                    }
                )
                .navigationBarItems(trailing:
                                        Button(action: {
                    profile.isLoggedIn = false
                    tokenService.deleteToken()
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.red)
                }
                )
                
            }
            .opacity(isSideBarOpened ? 0.8 : 1)
            .disabled(isSideBarOpened)
            
            if isSideBarOpened {
                SidebarView(selectedSection: $currentSection)
                    .ignoresSafeArea()
                    .transition(.move(edge: .leading))
                    .animation(.easeInOut)
                    .frame(width: 266)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .zIndex(2)
            }
        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct MainHomeView: View {
    var body: some View {
        
        VStack {
            HStack {
                Text("Електроника")
                    .font(.title3)
                Spacer()
                Text("Увидеть все")
                    .foregroundColor(.red)
                Image("Arrow")
            }
            .bold()
            .padding()
            ScrollView(.horizontal) {
                HStack(spacing: 14) {
                    ForEach(0..<10, id: \.self) { item in
                        MainCardView()
                            .padding(.bottom, 6)
                    }
                }
                .padding(.horizontal)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical)
    }
}

struct MainCardView: View {
    var body: some View {
        VStack {
            
            VStack {
                HStack(alignment: .top) {
                    Text("11.76 %")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(.pink)
                        .cornerRadius(25)
                    
                    Spacer()
                    
                    VStack(spacing: 8) {
                        
                        Button {
                            print("Heart button tapped")
                        } label: {
                            ZStack {
                                Circle()
                                    .frame(width: 50)
                                    .foregroundColor(.white)
                                Image(systemName: "heart")
                                    .font(.system(size: 24))
                                    .foregroundColor(.gray)
                            }
                        }

                        Button {
                            print("Cart button tapped")
                        } label: {
                            ZStack {
                                Circle()
                                    .frame(width: 50)
                                    .foregroundColor(.white)
                                Image(systemName: "cart")
                                    .font(.system(size: 24))
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .padding(10)
                Spacer()
            }
            .background(.gray.opacity(0.6))
            
            
            VStack {
                HStack {
                    VStack {
                        Text("150 000 сум")
                            .bold()
                        Text("170 000 сум")
                            .strikethrough(true, color: .red)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    
                    HStack {
                        Image(systemName: "star.fill")
                        Text("3,00")
                    }
                    .foregroundColor(.white)
                    .padding(7)
                    .background(.pink)
                    .cornerRadius(5)
                }
                .padding(8)
                Text("Беспроводные наушники Airpods 2.2 lux copy")
                    .padding(.bottom)
            }
            
        }

        .frame(width: 240, height: 300)
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}
