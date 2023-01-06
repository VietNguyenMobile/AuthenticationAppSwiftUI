//
//  TodoRowView.swift
//  AuthenticationAppSwiftUI
//
//  Created by Macbook on 06/01/2023.
//

import SwiftUI

struct TodoRowView: View {
    
    var todo: Todos
    
    var body: some View {
        HStack {
            Text(todo.todo)
            Spacer()
            if todo.isCompleted == "true" {
                Image(systemName: "checkmark").imageScale(.medium)
            } else {
                Image(systemName: "xmark").imageScale(.medium)
            }
        }
    }
}

struct TodoRowView_Previews: PreviewProvider {
    static var previews: some View {
        TodoRowView(todo: Todos(todo: "To do 1", isCompleted: "false"))
    }
}
