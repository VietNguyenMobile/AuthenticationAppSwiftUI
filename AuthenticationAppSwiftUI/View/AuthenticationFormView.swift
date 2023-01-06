//
//  AuthenticationFormView.swift
//  AuthenticationAppSwiftUI
//
//  Created by Macbook on 05/01/2023.
//

import SwiftUI

struct AuthenticationFormView: View {
    
    @EnvironmentObject var authState: AuthenticationState
    @State var email: String = ""
    @State var password: String = ""
    @State var passwordConf: String = ""
    @State var isShowPassword = false
    
    @State var authType: AuthenticationType
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("Email", text: $email)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            
            if isShowPassword {
                TextField("Password", text: $password)
                    .textContentType(.password)
                    .autocapitalization(.none)
            } else {
                SecureField("Password", text: $password)
            }
            
            if authType == .signup {
                if isShowPassword {
                    TextField("Password Confirm", text: $passwordConf)
                        .textContentType(.password)
                        .autocapitalization(.none)
                } else {
                    SecureField("Password Confirm", text: $passwordConf)
                }
            }
            
            Toggle("Show password", isOn: $isShowPassword)
            
            Button(action: {
                emailAuthticationTapped()
            }) {
                Text(authType.text).font(.callout)
            }.disabled(email.count == 0 || password.count == 0)
            
            Button(action: footerButtonTapped) {
                Text(authType.footerText)
                    .font(.callout)
            }
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .frame(width: 300)
    }
    
    private func emailAuthticationTapped() {
        switch authType {
        case .login:
            authState.login(with: email, password: password)
        default:
            authState.signUp(email: email, password: password, passwordConfirm: passwordConf)
        }
        
    }
    
    private func footerButtonTapped() {
        clearFormField()
        authType = authType == .signup ? .login : .signup
    }
    
    private func clearFormField() {
        email = ""
        password = ""
        passwordConf = ""
        isShowPassword = false
    }
}

//struct AuthenticationFormView_Previews: PreviewProvider {
//    static var previews: some View {
//        AuthenticationFormView()
//    }
//}
