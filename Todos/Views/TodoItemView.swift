//
//  TodoItemView.swift
//  Todos
//
//  Created by Mustapha Latrach on 08/12/2023.
//

import SwiftUI

struct TodoItemView: View {
    
    @Binding var todoItem:TodoModel
    
    var body: some View {
        HStack 
        {
            Image(systemName: todoItem.isCompleted ? "checkmark.circle":"circle")
                .foregroundColor(todoItem.isCompleted ? Color.red:Color.green)
            if (todoItem.isCompleted)
            {
                Text(todoItem.todo)
                    .strikethrough(color: Color.red)
            } else {
                Text(todoItem.todo)
            }
            Spacer()
        }
        .font(.title)
        .onTapGesture
        {
            withAnimation(.easeInOut) {
                todoItem = todoItem.toggleIsCompleted()
            }
        }
    }
}

#Preview {
    
    Group{
        TodoPreview(item: TodoModel(todo: "Test 1", isCompleted: false))
        TodoPreview(item: TodoModel(todo: "Test 2", isCompleted: true))
    }
}

struct TodoPreview: View {
    @State var item:TodoModel
    var body: some View {
        TodoItemView(todoItem: $item)
    }
}
