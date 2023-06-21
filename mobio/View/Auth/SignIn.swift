//
//  Login.swift
//  mobio
//
//  Created by Oyatullo Koraboev on 16/06/23.
//

import SwiftUI
import InputMask

struct SignIn: View {
    @State var username: String = ""

    @State var emailText: String = ""
    @State var passwordText: String = ""
    @State var passwordText2: String = ""
    @State var codeText: String = ""
    @State var phoneNumberText: String = ""
    @State var phoneNumber: String = ""
    @State var nice: Bool = true
    @State private var showPassword: Bool = false
    @State private var showPassword2: Bool = false
    
    var body: some View {
        VStack(spacing: 15) {
            
            ExtractedView(text: $emailText, title: "Email")

            VStack(alignment:.leading) {
                Text("Пароль")
                    .font(.montserratRegular(size:10))
                    .foregroundColor(Color(hex: "#AEAEAE"))
                
                ZStack(alignment: .trailing) {
                    if showPassword {
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
                                            .opacity(0.3)
                                    }
                                }
                            )
                    } else {
                        SecureField("", text: $passwordText)
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
                                            .opacity(0.3)
                                    }
                                }
                            )
                    }
                    
                    Button(action: {
                        showPassword.toggle()
                    }) {
                        Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                            .foregroundColor(.gray)
                            .padding(.trailing, 10)
                    }
                }
            }
            .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
            
            VStack(alignment:.leading) {
                Text("Номер телефона")
                    .font(.montserratRegular(size:10))
                    .foregroundColor(Color(hex: "#AEAEAE"))
                MaskedTextField(
                    text: $username,
                    value: $phoneNumber,
                    complete: $nice,
                    placeholder: "+998",
                    primaryMaskFormat: "+998 ([00]) [000]-[00]-[00]"
                )
                .keyboardType(.numberPad)
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
                                .opacity(0.3)
                        }
                    }
                )
            }
            .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
            
            
//            ExtractedView(text: $phoneNumberText, title: "Код потверждения")
            VStack(alignment:.leading) {
                Text("Код потверждения")
                    .font(.montserratRegular(size:10))
                    .foregroundColor(Color(hex: "#AEAEAE"))
                
                ZStack(alignment: .trailing) {
                    if showPassword2 {
                        TextField("", text: $passwordText2)
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
                                            .opacity(0.3)
                                    }
                                }
                            )
                    } else {
                        SecureField("", text: $passwordText2)
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
                                            .opacity(0.3)
                                    }
                                }
                            )
                    }
                    
                    Button(action: {
                        showPassword2.toggle()
                    }) {
                        Image(systemName: showPassword2 ? "eye.fill" : "eye.slash.fill")
                            .foregroundColor(.gray)
                            .padding(.trailing, 10)
                    }
                }
            }
            .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
            
            Spacer()
            
            Button {
                print("Регистрация")
            } label: {
                HStack {
                    Spacer()
                    Text("Регистрация")
                        .font(.montserratRegular(size:20))
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color(hex: "#E41B4D"), Color(hex: "#EE3D69")]), startPoint: .leading, endPoint: .trailing)
            )
            .opacity((phoneNumber.count == 9 && passwordText.count >= 8) ? 1.0 : 0.7)
            .disabled(!(phoneNumber.count == 9 && passwordText.count >= 8))
            .cornerRadius(25)
            .padding(EdgeInsets(top: 0, leading: 30, bottom: 40, trailing: 30))
        }
    }
    
//    struct Login_Previews: PreviewProvider {
//        static var previews: some View {
//            SignIn()
//        }
//    }
}

struct ExtractedView: View {
    @Binding var text:String
    @State var title:String
    var body: some View {
        VStack(alignment:.leading) {
            Text(title)
                .font(.montserratRegular(size:10))
                .foregroundColor(Color(hex: "#AEAEAE"))
            TextField("", text: $text)
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
                                .opacity(0.3)
                    }
                }
            )
        }
        .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
    }
}
