//
//  Login.swift
//  mobio
//
//  Created by Oyatullo Koraboev on 16/06/23.
//

import SwiftUI

struct SignIn: View {
    var body: some View {
        @State var emailText: String = ""
        @State var passwordText: String = ""
        @State var codeText: String = ""
        @State var phoneNumberText: String = ""
        
        VStack(spacing: 20) {
            VStack(alignment:.leading) {
                Text("Email")
                    .font(.montserratRegular(size:10))
                TextField("", text: $emailText)
                    .frame(height: 40)
                    .padding(.top, -8)
                    .overlay(
                        ZStack {
                            GeometryReader { geometry in
                                Rectangle()
                                    .fill(Color(hex: "#AEAEAE"))
                                    .frame(height: 3)
                                    .frame(width: geometry.size.width)
                                    .offset(y: 35)
                            }
                        }
                    )
            }
            .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
            
            VStack(spacing: 40) {
                VStack(alignment:.leading) {
                    Text("Номер телефона")
                        .font(.montserratRegular(size:10))
                    TextField("", text: $phoneNumberText)
                        .frame(height: 40)
                        .padding(.top, -8)
                        .overlay(
                            ZStack {
                                GeometryReader { geometry in
                                    Rectangle()
                                        .fill(Color(hex: "#AEAEAE"))
                                        .frame(height: 3)
                                        .frame(width: geometry.size.width)
                                        .offset(y: 35)
                                }
                            }
                        )
                }
                .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
                
                VStack(spacing: 40) {
                    VStack(alignment:.leading) {
                        Text("Пароль")
                            .font(.montserratRegular(size:10))
                        TextField("", text: $passwordText)
                            .frame(height: 40)
                            .padding(.top, -8)
                            .overlay(
                                ZStack {
                                    GeometryReader { geometry in
                                        Rectangle()
                                            .fill(Color(hex: "#AEAEAE"))
                                            .frame(height: 3)
                                            .frame(width: geometry.size.width)
                                            .offset(y: 35)
                                    }
                                }
                            )
                    }
                    .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
                    
                    VStack(alignment:.leading) {
                        Text("Потверждения Пароля")
                            .font(.montserratRegular(size:10))
                        TextField("", text: $codeText)
                            .frame(height: 40)
                            .padding(.top, -8)
                            .overlay(
                                ZStack {
                                    GeometryReader { geometry in
                                        Rectangle()
                                            .fill(Color(hex: "#AEAEAE"))
                                            .frame(height: 3)
                                            .frame(width: geometry.size.width)
                                            .offset(y: 35)
                                    }
                                }
                            )
                        
                    }
                    .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
                    
                    
                }
            }
        }
    }
    
    struct Login_Previews: PreviewProvider {
        static var previews: some View {
            SignIn()
        }
    }
}
