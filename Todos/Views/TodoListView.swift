//
//  TodoListView.swift
//  Todos
//
//  Created by Mustapha Latrach on 08/12/2023.
//

import SwiftUI


struct TodoListView: View {
    
    @EnvironmentObject var todoViewModel:TodoViewModel
    
    var body: some View {
        ZStack {
            if (todoViewModel.todos.count>0){
                List($todoViewModel.todos,id:\.id, editActions: .all){ $todo in
                    TodoItemView(todoItem: $todo)
                }
            } else {
                Text("Nothing to do ! 😴")
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
            }
        }
        .navigationTitle("TODO List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:NavigationLink("Add", destination: {TodoAddView()})
        )
    }
}

#Preview {
    NavigationView{
        TodoListView().environmentObject(TodoViewModel(
            testItems: [
                TodoModel(todo: "Todo 1", isCompleted: false),
                TodoModel(todo: "Second Todo 2", isCompleted: false),
                TodoModel(todo: "Third 3", isCompleted: true)
            ]
        ))
    }
}


