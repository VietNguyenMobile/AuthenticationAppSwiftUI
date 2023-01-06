//
//  ContentView.swift
//  AuthenticationAppSwiftUI
//
//  Created by Macbook on 05/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var authState: AuthenticationState
    
    var body: some View {
        Group {
            if authState.loggedInUser != nil {
//                HomeView()
                TodoListView()
            } else {
                SignUpView(authType: .signup)
            }
        }
        .animation(.easeInOut)
        .transition(.move(edge: .bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
