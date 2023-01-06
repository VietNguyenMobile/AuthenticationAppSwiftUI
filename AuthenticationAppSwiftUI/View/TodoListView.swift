//
//  TodoListView.swift
//  AuthenticationAppSwiftUI
//
//  Created by Macbook on 06/01/2023.
//

import SwiftUI

struct TodoListView: View {
    
    var todos: [Todos] = [
        Todos(todo: "To do 1", isCompleted: "false", key: "1"),
        Todos(todo: "To do 2", isCompleted: "false", key: "2"),
        Todos(todo: "To do 3", isCompleted: "true", key: "3"),
        Todos(todo: "To do 4", isCompleted: "false", key: "4"),
        Todos(todo: "To do 5", isCompleted: "true", key: "5"),
        Todos(todo: "To do 6", isCompleted: "false", key: "6"),
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: NewTodoView()) {
                    Text("Add todo")
                }
                
                List(todos) { todo in
                    NavigationLink(destination: TodoDetail(todo: todo)) {
                        TodoRowView(todo: todo)
                    }
                }
            }
            .navigationTitle("To do list")
                .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
