//
//  SignUpView.swift
//  AuthenticationAppSwiftUI
//
//  Created by Macbook on 05/01/2023.
//

import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var authSate: AuthenticationState
    
    @State var authType = AuthenticationType.login
    
    var body: some View {
        ZStack {
            VStack(spacing: 32) {
                Text("Authentication")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                
                if authSate.isAuthenticating {
                    ProgressView()
                } else {
                    AuthenticationFormView(authType: authType)
                }
            }.offset(y: UIScreen.main.bounds.width > 320 ? -75 : 0)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(authType: .signup)
    }
}
