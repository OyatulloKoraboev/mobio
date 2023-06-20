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
                            Text("Welcome to home")
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
                        
                        CircleGridView()
                            .frame(maxHeight: .infinity,alignment:.top)
                            .padding(.top,100)
                            
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

