//
//  AuthenticationAppSwiftUIApp.swift
//  AuthenticationAppSwiftUI
//
//  Created by Macbook on 05/01/2023.
//

import SwiftUI
import FirebaseCore

@main
struct AuthenticationAppSwiftUIApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        let loginState = AuthenticationState.shared
        WindowGroup {
            ContentView().environmentObject(loginState)
        }
    }
}
