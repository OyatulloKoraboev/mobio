//
//  SignIn.swift
//  mobio
//
//  Created by Oyatullo Koraboev on 16/06/23.
//

import SwiftUI

struct Login: View {
    @State var username: String = ""
    @State var passwordText: String = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State var loggedIn:Bool = false
    
    @State private var showingLoginScreen = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            ExtractedView(text: $username, title: "Номер телефона")
            ExtractedView(text: $passwordText, title: "Пароль")
            
            Button {
                print("Востоновите Пароль")
            } label: {
                Text("Забыли пароль ?")
                    .font(.montserratRegular(size:14))
                    .foregroundColor(.black)
            }.padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0))
            
            Spacer()
            
            Button {
                authenticateUser(username: username, password: passwordText)
                
            } label: {
                Text("Авторизация")
                    .font(.montserratRegular(size:20))
                    .foregroundColor(.white)
            }
            
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color(hex: "#E41B4D"), Color(hex: "#EE3D69")]), startPoint: .leading, endPoint: .trailing)
            )
            .cornerRadius(25)
            .padding(EdgeInsets(top: 0, leading: 30, bottom: 40, trailing: 30))
            NavigationLink(destination: HomeView(), isActive: $loggedIn) {
                EmptyView()
            }
        }.navigationBarHidden(true)
    }
    
    func authenticateUser(username: String, password: String){
        if username.lowercased() == "Abc" {
            wrongUsername = 0
            if password.lowercased() == "123"{
                wrongPassword = 0
                
                loggedIn = true
            }
            else{
                wrongPassword = 2
            }
        }
        else{
            wrongUsername = 2
        }
    }
    
    struct SignIn_Previews: PreviewProvider {
        static var previews: some View {
            Login()
        }
    }
}
