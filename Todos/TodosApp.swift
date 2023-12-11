//
//  TodosApp.swift
//  Todos
//
//  Created by Mustapha Latrach on 08/12/2023.
//

import SwiftUI

@main
struct TodosApp: App {
    
    @StateObject var todoViewModel:TodoViewModel = TodoViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                TodoListView()
            }.environmentObject(todoViewModel)
            
        }
    }
}
