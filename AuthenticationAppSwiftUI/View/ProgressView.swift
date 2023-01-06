//
//  AuthFormView.swift
//  AuthenticationAppSwiftUI
//
//  Created by Macbook on 05/01/2023.
//

import UIKit
import SwiftUI

struct ProgressView: UIViewRepresentable {
   
    func makeUIView(context: UIViewRepresentableContext<ProgressView>) -> UIActivityIndicatorView {
        UIActivityIndicatorView(style: .large)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ProgressView>) {
        uiView.startAnimating()
    }
}
