//  Lists.swift
//  Todo
//
//  Created by CSUFTitan on 3/9/20.
//  Copyright © 2020 CSUFTitan. All rights reserved.
//

import SwiftUI

struct ContentView2: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: TodoItem.getAllTodoItems()) var todoItems:FetchedResults<TodoItem>
    @State private var newTodoItem = ""
    
    var body: some View {
        
        NavigationView {
            List{
                Section(header: Text("New Task?")) {
                    HStack {
                        TextField("Create New Task", text: self.$newTodoItem)
                        Button(action: {
                            let toDoItem = TodoItem(context: self.managedObjectContext)
                            toDoItem.title = self.newTodoItem
                            toDoItem.createdAt = Date()

                            do {
                                try self.managedObjectContext.save()
                            } catch {
                                print(error)
                            }

                            self.newTodoItem = ""

                        }){
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.blue)
                                .imageScale(.large)
                        }
                    }
                }.font(.headline)
                .foregroundColor(.white)
                
                Section(header: Text("Tasks:")) {
                    ForEach(self.todoItems) {todoItems in
                        TodoItemView(title: todoItems.title!, createdAt: "\(todoItems.createdAt!)")
                        
                    }.onDelete { indexSet in
                        let deleteItem = self.todoItems[indexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                        
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            print("error - could not save")
                        }
                    }
                    
                }
            }
            .foregroundColor(.white)
            .navigationBarTitle(Text("Tasks to Complete"))
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(trailing: EditButton().foregroundColor(.blue))
                
        }
        .colorScheme(.dark)
            
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}

