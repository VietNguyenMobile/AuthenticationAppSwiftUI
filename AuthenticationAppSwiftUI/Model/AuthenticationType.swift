//
//  AuthenticationType.swift
//  AuthenticationAppSwiftUI
//
//  Created by Macbook on 06/01/2023.
//

import Foundation

enum AuthenticationType: String {
    
    case login
    case signup
    
    var text: String {
        rawValue.capitalized
    }
    
    var footerText: String {
        switch self {
        case .login:
            return "Not a member, signup"
        case .signup:
            return "Already a member? login"
        }
    }
    
}
