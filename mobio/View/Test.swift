//
//  Test.swift
//  mobio
//
//  Created by Zekhniddin Jumaev on 21/06/23.
//

import SwiftUI

//struct OpeningView: View {
//
//    @State var selectedTab: Int = 0
//    @State var showProgressView: Bool = false
//
//    var body: some View {
//        ZStack {
//            VStack {
//                VStack {
//                    Image(uiImage: Resources.Images.logo)
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width:140)
//
//                    Text(Resources.Strings.someString)
//                        .multilineTextAlignment(.center)
//                        .frame(width: 180)
//                }.padding(EdgeInsets(top: 150, leading: 0, bottom: 0, trailing: 0))
//                Spacer()
//
//                HStack(spacing: 40){
//                    Button {
//                        selectedTab = 0
//                    } label: {
//                        Text("Логин")
//                            .font(.montserratRegular(size:20))
//                            .foregroundColor(selectedTab == 0 ? .black : .gray)
//                    }
//                    .frame(width: 130)
//
//                    .overlay(
//                        ZStack {
//                            if selectedTab == 0 {
//                                GeometryReader { geometry in
//                                    Rectangle()
//                                        .fill(Color.red)
//                                        .frame(height: 3)
//                                        .frame(width: geometry.size.width)
//                                        .offset(y: 28)
//                                }
//                            }
//                        }
//                    )
//
//                    Button{
//                        selectedTab = 1
//                    } label: {
//                        Text("Регистрация")
//                            .font(.montserratRegular(size:20))
//                            .foregroundColor(selectedTab == 1 ? .black : .gray)
//                    }
//                    .frame(width: 130)
//                    .overlay(
//                        ZStack {
//                            if selectedTab == 1 {
//                                GeometryReader { geometry in
//                                    Rectangle()
//                                        .fill(Color.red)
//                                        .frame(height: 3)
//                                        .frame(width: geometry.size.width)
//                                        .offset(y: 28)
//                                }
//                            }
//                        }
//                    )
//                }
//                .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
//
//                TabView(selection: $selectedTab) {
//                    Login(showProgressView: $showProgressView)
//                        .padding(.top, 30)
//                        .tabItem {
//                        }.tag(0)
//
//                    SignIn()
//                        .padding(.top, 30)
//                        .tabItem {
//                        }.tag(1)
//                }
//                .tabViewStyle(PageTabViewStyle())
//
//            }
//
//            CircularLoadingView(isShowing: $showProgressView, content: {
//                VStack { }
//            }, text: "Loading...")
//        }.ignoresSafeArea()
//    }
//}
