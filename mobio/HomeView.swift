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
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Color.gray.opacity(isSideBarOpened ? 1 : 0.2).animation(.easeOut)
                VStack {
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
                }
                TabbarView(selectedSection: $currentSection)
                    .frame(maxHeight: .infinity,alignment: .bottom)
                if isSideBarOpened {
                    SidebarView(selectedSection: $currentSection)
                        .transition(.move(edge: .leading))
                        .animation(.easeInOut)
                        .frame(width: 266)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .zIndex(1) // Set a higher z-index for the SidebarView
                }
        ZStack {
            Color.gray
                .edgesIgnoringSafeArea(.all)
            if isSideBarOpened {
                Color.black.opacity(0.1)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isSideBarOpened.toggle()
                    }
                    .zIndex(1)
            }
            
            NavigationView {
                VStack {
                    Spacer()
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
            }
            .opacity(isSideBarOpened ? 0.4 : 1)
            .disabled(isSideBarOpened)
            
            if isSideBarOpened {
                SidebarView()
                    .ignoresSafeArea()
                    .transition(.move(edge: .leading))
                    .animation(.easeInOut)
                    .frame(width: 266)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .zIndex(2)
            }
            .ignoresSafeArea()
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                isSideBarOpened.toggle()
            }) {
                Image(systemName: "list.bullet")
            })
        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

