//
//  Home.swift
//  mobio
//
//  Created by Oyatullo Koraboev on 16/06/23.
//

import SwiftUI

struct HomeView: View {
    @State private var isSideBarOpened:Bool = false
    @State private var currentSection:Section = .home
    
    var body: some View {
        ZStack {
            Color.gray.opacity(isSideBarOpened ? 1 : 0.2).animation(.easeOut)
            VStack{
                Spacer()
                
                
                Button {
                    isSideBarOpened.toggle()
                } label: {
                    Text(isSideBarOpened ? "Open" : "Close")
                }
                .frame(maxWidth: .infinity,alignment: .trailing)
                .padding(.trailing,20)
                
                Spacer()
                
                   
                    
            }
            TabbarView(selectedSection: $currentSection)
                .frame(maxHeight: .infinity,alignment: .bottom)
            if isSideBarOpened {
                SidebarView()
                    .transition(.move(edge: .leading))
                    .animation(.easeInOut)
                    .frame(width: 266)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .zIndex(1) // Set a higher z-index for the SidebarView
            }
        }
        .ignoresSafeArea()
        .navigationBarTitle("Home", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

