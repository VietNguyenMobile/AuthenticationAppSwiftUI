//
//  Todos.swift
//  AuthenticationAppSwiftUI
//
//  Created by Macbook on 06/01/2023.
//

import SwiftUI

struct Todos: Identifiable {
    let id: String
    
    let todo:String
    let isCompleted: String
    let key: String
    
    init(todo: String, isCompleted: String, key: String = "") {
        self.id = key
        self.todo = todo
        self.isCompleted = isCompleted
        self.key = key
    }
}
