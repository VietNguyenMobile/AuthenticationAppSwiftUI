//
//  WebSwiftUIView.swift
//  AuthenticationAppSwiftUI
//
//  Created by Macbook on 06/01/2023.
//

import SwiftUI
import WebKit

struct WebSwiftUIView: UIViewRepresentable {

    let url: URL
    @Binding var isLoading: Bool
    @Binding var error: NSError?
    
    func makeUIView(context: UIViewRepresentableContext<WebSwiftUIView>) -> WKWebView {
        let webView = WKWebView(frame: .zero)
        webView.backgroundColor = .systemBackground
        webView.navigationDelegate = context.coordinator
        webView.scrollView.contentSize = .zero
        
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebSwiftUIView>) {
        print("updateUIView")
    }
    
    func makeCoordinator() -> WebSwiftUIView.Coordinator {
        Coordinator(isLoading: $isLoading, error: $error)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        @Binding var isLoading: Bool
        @Binding var error: NSError?
        
        init(isLoading: Binding<Bool>, error: Binding<NSError?>) {
            self._isLoading = isLoading
            self._error = error
            super.init()
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            DispatchQueue.main.async {
                self.isLoading = true
                self.error = nil
            }
        }
        
        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            DispatchQueue.main.async {
                self.isLoading = true
            }
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            DispatchQueue.main.async {
                self.isLoading = false
                self.error = error as NSError
            }
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            DispatchQueue.main.async {
                self.isLoading = false
            }
        }
    }
}

//struct WebSwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        WebSwiftUIView()
//    }
//}
