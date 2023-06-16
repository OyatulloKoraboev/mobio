//
//  SignIn.swift
//  mobio
//
//  Created by Oyatullo Koraboev on 16/06/23.
//

import SwiftUI

struct Login: View {
    var body: some View {
        @State var loginText: String = ""
        @State var passwordText: String = ""
        VStack(spacing: 40) {
            VStack(alignment:.leading) {
                Text("Номер телефона")
                    .font(.montserratRegular(size:12))
                TextField("", text: $loginText)
                    .frame(height: 40)
                    .padding(.top, -10)
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
                Text("Пароль")
                    .font(.montserratRegular(size:12))
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
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
