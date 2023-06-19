//
//  Home.swift
//  mobio
//
//  Created by Oyatullo Koraboev on 16/06/23.
//

import SwiftUI

struct HomeView: View {
    @State private var isSideBarOpened:Bool = false
    var body: some View {
        ZStack {
            Color.gray
            HStack{
                if isSideBarOpened{
                    SidebarView()
                        .transition(.move(edge: .leading))
                        .animation(.easeInOut)
                        .frame(width: 266)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            HStack{
                Spacer()
                
                Button {
                    withAnimation {
                        isSideBarOpened.toggle()
                    }
                } label: {
                    Text(isSideBarOpened ? "Hide" : "Open")
                }
            }
        }
        .navigationBarTitle("Home", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
