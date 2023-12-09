//
//  TodoModel.swift
//  Todos
//
//  Created by Mustapha Latrach on 09/12/2023.
//

import Foundation

struct TodoModel:Identifiable, Codable {
    let id:String
    let todo:String
    let isCompleted:Bool
    
    init(id:String=UUID().uuidString, todo:String, isCompleted:Bool){
        self.id=id
        self.todo=todo
        self.isCompleted=isCompleted
    }
    
    func toggleIsCompleted()->TodoModel {
        return TodoModel(id: self.id, todo: self.todo, isCompleted: !self.isCompleted)
    }
}
