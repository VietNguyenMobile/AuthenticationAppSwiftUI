//
//  AuthenticationState.swift
//  AuthenticationAppSwiftUI
//
//  Created by Macbook on 05/01/2023.
//

import AuthenticationServices
import FirebaseAuth

class AuthenticationState: NSObject, ObservableObject {
    
    @Published var isAuthenticating = false
    @Published var loggedInUser: User?
    @Published var error: NSError?
//    static var currentUser: FirebaseAuth.User?
    
    static let shared = AuthenticationState()
    
    private let auth = Auth.auth()
    

    override init() {
        loggedInUser = auth.currentUser
        super.init()
        
        auth.addStateDidChangeListener(authStateChanged)
    }
    
    private func authStateChanged(with auth: Auth, user: User?) {
        guard user != self.loggedInUser else {
            return
        }
        self.loggedInUser = user
    }
    
    func login(with email: String, password: String) {
        isAuthenticating = true
        error = nil
        handleSignInWith(email: email, password: password)
    }
    
    func signOut() {
        try? auth.signOut()
    }
    
    func signUp(email: String, password: String, passwordConfirm: String) {
        guard password == passwordConfirm else {
            error = NSError(domain: "", code: 9000, userInfo: [NSLocalizedDescriptionKey: "Password and PasswordConfirm does not match!"])
            return
        }
        
        self.isAuthenticating = true
        self.error = nil
        
        auth.createUser(withEmail: email, password: password, completion: handleAuthResultCompletion)
    }
    
    private func handleSignInWith(email: String, password: String) {
        auth.signIn(withEmail: email, password: password, completion: handleAuthResultCompletion)
    }
    
    private func handleAuthResultCompletion(auth: AuthDataResult?, error: Error?) {
        DispatchQueue.main.async {
            self.isAuthenticating = false
            if let user = auth?.user {
                self.loggedInUser = user
                print("Login success! \(user)")
            } else if let error = error {
                print("Login failed! \(error.localizedDescription)")
                self.error = error as NSError
            }
        }
    }
}
