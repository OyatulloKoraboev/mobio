//
//  mobioApp.swift
//  mobio
//
//  Created by Oyatullo Koraboev on 16/06/23.
//

import SwiftUI

@main
struct mobioApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Profile())
        }
    }
}

class Profile: ObservableObject {
    @Published var isLoggedIn = false
}
