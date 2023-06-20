//
//  Login.swift
//  mobio
//
//  Created by Oyatullo Koraboev on 16/06/23.
//

import SwiftUI

struct SignIn: View {
    @State var emailText: String = ""
    @State var passwordText: String = ""
    @State var codeText: String = ""
    @State var phoneNumberText: String = ""
    
    var body: some View {
        VStack(spacing: 15) {
            ExtractedView(text: $emailText, title: "Email")
            ExtractedView(text: $passwordText, title: "Пароль")
            ExtractedView(text: $codeText, title: "Номер телефона")
            ExtractedView(text: $phoneNumberText, title: "Код потверждения")
            
            Spacer()
            
            Button {
                print("Регистрация")
            } label: {
                Text("Регистрация")
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
        }
        
        
        
    }
    
    struct Login_Previews: PreviewProvider {
        static var previews: some View {
            SignIn()
        }
    }
}

struct ExtractedView: View {
    @Binding var text:String
    @State var title:String
    var body: some View {
        VStack(alignment:.leading) {
            Text(title)
                .font(.montserratRegular(size:10))
                .foregroundColor(Color(hex: "#AEAEAE"))
            TextField(title == "Номер телефона" ? "+998" : "", text: $text)
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
