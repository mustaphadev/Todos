//
//  TodoAddView.swift
//  Todos
//
//  Created by Mustapha Latrach on 08/12/2023.
//

import SwiftUI

struct TodoAddView: View {
    
    @State var text:String = ""
    @EnvironmentObject var todoViewModel:TodoViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        
        VStack {
            TextField("Tap your todo here ...", text: $text)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color.init(red: 0.9, green: 0.9, blue: 0.9))
                .cornerRadius(10)
            Button(
                action: {
                    todoViewModel.addTodo(text: text)
                    presentationMode.wrappedValue.dismiss()
                },
                label: {
                    Text("SAVE")
                        .padding()
                        .padding(.horizontal)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.accentColor)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
            )
            .disabled(!todoViewModel.validateTodo(txt: text))
            Spacer()
        }
        .padding()
        .navigationTitle("Add Todo ✏️")
    }
}

#Preview {
    NavigationView{
        TodoAddView().environmentObject(TodoViewModel())
    }
}
