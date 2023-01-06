//
//  HomeView.swift
//  AuthenticationAppSwiftUI
//
//  Created by Macbook on 06/01/2023.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var authState: AuthenticationState
    
    let url = URL(string: "https://www.duolingo.com/learn")!
    @State var isLoading = false
    @State var error: NSError?
    
    var body: some View {
        NavigationView {
            ZStack {
                WebSwiftUIView(url: url, isLoading: $isLoading, error: $error)
                    .opacity(!isLoading && error == nil ? 1 : 0)
                
                if self.isLoading {
                    ProgressView()
                } else if self.error != nil {
                    Text(error!.localizedDescription)
                }
            }.background(Color(UIColor.systemBackground))
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button(action: {
                    signOutTapped()
                }, label: {
                    Image(systemName: "person.circle")
                    Text("Logout")
                }))
                .edgesIgnoringSafeArea(.vertical)
        }
    }
    
    private func signOutTapped() {
        authState.signOut()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
