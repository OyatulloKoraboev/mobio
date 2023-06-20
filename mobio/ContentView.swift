//
//  ContentView.swift
//  mobio
//
//  Created by Oyatullo Koraboev on 16/06/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var profile: Profile

    var body: some View {
        VStack {
            if UserDefaults.standard.string(forKey: UserDefaultsManager.Token.access_token.rawValue) != nil || profile.isLoggedIn {
                HomeView()
            } else {
                OpeningView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
