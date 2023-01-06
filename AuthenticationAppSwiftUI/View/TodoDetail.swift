//
//  TodoDetail.swift
//  AuthenticationAppSwiftUI
//
//  Created by Macbook on 06/01/2023.
//

import SwiftUI

struct TodoDetail: View {
    
    @State var complete = false
    
    var todo: Todos
    
    var body: some View {
        HStack (alignment: .center, spacing: 20) {
            Text(todo.todo)
            Spacer()
            VStack {
                Text("is Complete")
                Button(action: {
                    buttonPressed()
                }) {
                    if self.complete == true {
                        Image(systemName: "checkmark").imageScale(.medium)
                    } else {
                        Image(systemName: "xmark").imageScale(.medium)
                    }
                }.onAppear() {
                    self.setupButton()
                }
            }
        }
    }
    
    func setupButton() {
        if todo.isCompleted == "true" {
            complete = true
        } else {
            complete = false
        }
    }
    
    func buttonPressed() {
        if complete == true {
            self.complete = false
        } else {
            self.complete = true
        }
    }
}

struct TodoDetail_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetail(todo: Todos(todo: "To do 1", isCompleted: "true"))
    }
}
