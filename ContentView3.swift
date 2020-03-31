
//
//  Lists.swift
//  Todo
//
//  Created by CSUFTitan on 3/9/20.
//  Copyright © 2020 CSUFTitan. All rights reserved.
//

import SwiftUI

struct ContentView3: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext2
    @FetchRequest(fetchRequest: Entity.getAllLists()) var lists:FetchedResults<Entity>
    @State private var newList = ""
    
    var body: some View {
        
        NavigationView {
                List{
                    Section(header: Text("Create a new list")) {
                        HStack {
                            TextField("Create a new todo list", text: self.$newList)
                            Button(action: {
                                let listItem = Entity(context: self.managedObjectContext2)
                                listItem.listTitle = self.newList
                                listItem.listCreatedAt = Date()

                                do {
                                    try self.managedObjectContext2.save()
                                } catch {
                                    print(error)
                                }

                                self.newList = ""
                            }){
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.blue)
                                    .imageScale(.large)
                            }
                        }
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    
                    Section(header: Text("Tasks:")) {
                        ForEach(self.lists) {lists in
                            ListView(listTitle: lists.listTitle!, listCreatedAt: "\(lists.listCreatedAt!)")

                        }.onDelete { indexSet in
                            let deleteItem = self.lists[indexSet.first!]
                            self.managedObjectContext2.delete(deleteItem)

                            do {
                                try self.managedObjectContext2.save()
                            } catch {
                                print("error - could not save")
                            }
                        }

                    }
                    
                }
                .navigationBarTitle(Text("My Lists"))
                .navigationBarItems(trailing: EditButton().foregroundColor(.blue))
            }
            .navigationBarBackButtonHidden(true)
            .colorScheme(.dark)
        }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}
