//
//  TodoViewModel.swift
//  Todos
//
//  Created by Mustapha Latrach on 09/12/2023.
//

import Foundation


class TodoViewModel:ObservableObject {
    
    @Published var todos:[TodoModel]=[]{
        didSet
        {
            saveTodos()
        }
    }
    
    let savedTodosKey = "saved_todos_key"
    
    init(initItems:[TodoModel]=[]) {
        if (initItems.isEmpty){
            getTodos()
        }
        else
        {
            todos = initItems
        }
    }
    
    func getTodos(){
        guard
            let savedData = UserDefaults.standard.data(forKey: savedTodosKey),
            let decodedTodos = try? JSONDecoder().decode([TodoModel].self, from: savedData)
        else {return}
        todos=decodedTodos
    }
    
    func saveTodos(){
        guard 
            let encodedTodos = try? JSONEncoder().encode(todos)
        else {return}
        print(encodedTodos)
        UserDefaults.standard.setValue(encodedTodos, forKey: savedTodosKey)
    }
    
    func toggleIsCompleted(todo:TodoModel){
        if let idx = todos.firstIndex(where: { $0.id == todo.id }){
            todos[idx] = todo.toggleIsCompleted()
        }
    }
    
    func deleteTodo(indexSet:IndexSet){
        todos.remove(atOffsets: indexSet)
    }
    
    func moveTodo(from:IndexSet, to:Int){
        todos.move(fromOffsets: from, toOffset: to)
    }
    
    func addTodo(text:String){
        todos.append(TodoModel(todo: text, isCompleted: false))
    }
    
    func validateTodo(txt:String)->Bool{
        return txt.count>3
    }
}
