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
        List{
            if (todoViewModel.todos.count>0){
                ForEach(todoViewModel.todos) { todo in
                    TodoItemView(todoItem: todo)
                        .onTapGesture(
                            perform: {
                                todoViewModel.toggleIsCompleted(todo: todo)
                            }
                        )
                }
                .onMove(perform: todoViewModel.moveTodo)
                .onDelete(perform: todoViewModel.deleteTodo)
            } else {
                Text("Nothing to do ! 😴")
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
        }
        .listStyle(.plain)
        .navigationTitle("TODO List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:NavigationLink("Add", destination: {TodoAddView()})
        )
        
    }
}

#Preview {
    NavigationView{
        TodoListView().environmentObject(TodoViewModel(initItems: [
                TodoModel(todo: "Todo 1", isCompleted: false),
                TodoModel(todo: "Second Todo 2", isCompleted: false),
                TodoModel(todo: "Third 3", isCompleted: true)
            ]))
    }
}


