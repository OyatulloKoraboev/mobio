//
//  TabbarView.swift
//  mobio
//
//  Created by Zekhniddin Jumaev on 18/06/23.
//

import SwiftUI

enum Section {
    case search
    case home
    case basket
    case glavnieOkno
    case departments
    case izobrajenie
    case voprosi
    case vetvi
    case nastroyki
}

struct TestView: View {
    @State var selectedTabBarIndex: Section = .home

    var body: some View {
        
        VStack {
            Spacer()
            if selectedTabBarIndex == .search {
                Text("Welcome to search")
            } else if selectedTabBarIndex == .basket {
                Text("Welcome to basket")
            } else {
                Text("Welcome to home")
            }
            Spacer()
            
            TabbarView(selectedSection: $selectedTabBarIndex)

        }
        .ignoresSafeArea(.all, edges: [.bottom, .trailing, .leading])
        .background(Color.init(hex: "F7F7F8"))
    }
}

//struct TabbarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabbarView()
//    }
//}

struct TabbarView: View {
    
    @Binding var selectedSection: Section
    
    var body: some View {
        ZStack {
            HStack {
                Spacer()

                Button(action: {
                    selectedSection = .search
                    print("Search button tapped")
                }, label: {
                    Image("Red_Search")
                })
                
                Spacer()
                
                Spacer()
                
                Button(action: {
                    selectedSection = .basket
                    print("Basket button tapped")
                }, label: {
                    Image("Red_Basket")
                })
                
                Spacer()
            }
            .padding(.top, 20)
            .padding(.bottom, 30)
            .background(.white)
            .cornerRadius(25)
            .shadow(radius: 4)

            Button(action: {
                selectedSection = .home
                print("home button tapped")
            }, label: {
                HomeButtonView()
                    .offset(y: -40)
            })
        }
  
    }
}



struct HomeButtonView: View {
    
    var body: some View {
        ZStack {
            Circle()
                .frame(height: 70)
                .foregroundColor(.white)
                .shadow(radius: 4)
            Image("Red_Home")
        }
    }
}


//struct HomeButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeButtonView()
//    }
//}
