//
//  HomeView.swift
//  mobio
//
//  Created by Oyatullo Koraboev on 16/06/23.
//

import SwiftUI
import Combine

struct OpeningView: View {
    @State var isLoginPagePressed:Bool = true
    @State var isSignInPagePressed:Bool = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.white
                VStack(spacing: 10){
                    VStack {
                        Image(uiImage: Resources.Images.logo)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:140)
                        
                        Text(Resources.Strings.someString)
                            .multilineTextAlignment(.center)
                            .frame(width: 180)
                    }.padding(EdgeInsets(top: 150, leading: 0, bottom: 0, trailing: 0))
                    
                    HStack(spacing: 40){
                        Button{
                            isLoginPagePressed = true
                            isSignInPagePressed = false
                        } label: {
                            Text("Логин")
                                .font(.montserratRegular(size:20))
                                .foregroundColor(isLoginPagePressed ? .black : .gray)
                        }
                        .frame(width: 130)
                        
                        .overlay(
                            ZStack {
                                if isLoginPagePressed {
                                    GeometryReader { geometry in
                                        Rectangle()
                                            .fill(Color.red)
                                            .frame(height: 3)
                                            .frame(width: geometry.size.width)
                                            .offset(y: 28)
                                    }
                                }
                            }
                        )
                        
                        
                        Button{
                            isLoginPagePressed = false
                            isSignInPagePressed = true
                        } label: {
                            Text("Регистрация")
                                .font(.montserratRegular(size:20))
                                .foregroundColor(isSignInPagePressed ? .black : .gray)
                        }
                        .frame(width: 130)
                        .overlay(
                            ZStack {
                                if !isLoginPagePressed {
                                    GeometryReader { geometry in
                                        Rectangle()
                                            .fill(Color.red)
                                            .frame(height: 3)
                                            .frame(width: geometry.size.width)
                                            .offset(y: 28)
                                    }
                                }
                            }
                        )
                    }
                    .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                    
                    if isLoginPagePressed{
                        withAnimation {
                            Login()
                                .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                        }
                    }else{
                        withAnimation {
                            SignIn()
                                .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                        }
                    }
                    
                    Spacer()
                }
                
            }.ignoresSafeArea()
        }
    }
    func authenticateUser(username: String, password: String){}
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        OpeningView()
    }
}
