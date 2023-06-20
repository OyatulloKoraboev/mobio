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
        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

