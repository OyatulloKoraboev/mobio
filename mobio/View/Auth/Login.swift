//
//  SignIn.swift
//  mobio
//
//  Created by Oyatullo Koraboev on 16/06/23.
//

import SwiftUI
import InputMask
import CustomAlert

struct Login: View {
    @EnvironmentObject var profile: Profile
    
    @State var username: String = ""
    @State var passwordText: String = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State var loggedIn:Bool = false
    @State var nice: Bool = true
    @State var phoneNumber: String = ""
    @State var buttonState: Bool = false
    @State var showAlert: Bool = false
    @Binding var showProgressView: Bool
    @State private var showPassword: Bool = false
    
    let service = NetworkManager()
    let tokenService = UserDefaultsManager()
    
    @State private var showingLoginScreen = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
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
            
            Button {
                print("Востоновите Пароль")
            } label: {
                Text("Забыли пароль ?")
                    .font(.montserratRegular(size:14))
                    .foregroundColor(.black)
            }.padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0))
            
            Spacer()
            
            Button {
                authenticateUser(username: phoneNumber, password: passwordText)
                
            } label: {
                HStack {
                    Spacer()
                    Text("Авторизация")
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
            .opacity((phoneNumber.count == 9 && passwordText.count >= 8) ? 1.0 : 0.5)
            .disabled(!(phoneNumber.count == 9 && passwordText.count >= 8))
            .cornerRadius(25)
            .padding(EdgeInsets(top: 0, leading: 30, bottom: 40, trailing: 30))
            NavigationLink(destination: HomeView(), isActive: $loggedIn) {
                EmptyView()
            }
            
            
        }.navigationBarHidden(true)
            .customAlert(isPresented: $showAlert) {
                Text("Your password or login is incorrect.")
            } content: { } actions: {
                Button {
                    print("Button clicked")
                } label: {
                    Text("OK")
                        .bold()
                }
            }
        
    }
    
    func authenticateUser(username: String, password: String){
        print(username, password, "salom")
        showProgressView = true
        service.performRequest(phoneNum: username, password: password) { response in
            showProgressView = false
            switch response {
            case .success(let token):
                tokenService.saveToken(token: token)
                profile.isLoggedIn = true
            case .failure(let error):
                // Show alert
                showAlert.toggle()
                print(error)
            }
        }
    }
}
