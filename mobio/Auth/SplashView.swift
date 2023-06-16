//
//  SplashView.swift
//  mobio
//
//  Created by Oyatullo Koraboev on 16/06/23.
//

import SwiftUI

struct SplashView: View {
    @State private var isLoading = true

    var body: some View {
        Group {
            if isLoading {
                LoadingView(isLoading: $isLoading) {
                    SplashView()
                }
            } else {
                NavigationView {
                    OpeningView()
                        .transition(.slide)
                }
                .navigationViewStyle(StackNavigationViewStyle())
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isLoading = false
            }
        }
    }
}


struct LoadingView<Content: View>: View {
    @Binding var isLoading: Bool
    let content: Content

    init(isLoading: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self._isLoading = isLoading
        self.content = content()
    }

    var body: some View {
        ZStack {
            Color(hex: "#E41B4D")
            VStack {
                withAnimation {
                    Image("whitelogo")
                        .resizable()
                        .scaledToFit()
                        .padding(EdgeInsets(top: 0, leading: 90, bottom: 0, trailing: 90))
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
