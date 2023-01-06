//
//  NewTodoView.swift
//  AuthenticationAppSwiftUI
//
//  Created by Macbook on 06/01/2023.
//

import SwiftUI

struct NewTodoView: View {
    
    @State private var newTodo = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Text("Todo: ")
                TextField("Enter Todo", text: $newTodo)
                    .padding()
            }
            Button(action: {
                addTodo()
            }) {
                Text("Add")
            }
        }
    }
    
    func addTodo() {
        if !newTodo.isEmpty {
            // Add todo
            
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView()
    }
}
