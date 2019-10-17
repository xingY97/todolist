//
//  ContentView.swift
//  todolist
//
//  Created by XIN on 10/15/19.
//  Copyright © 2019 XIN. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Todoitem.getAllTodoitem()) var toDoitems:FetchedResults<Todoitem>
    
    @State private var newTodoitem = ""
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Please add to your list?")){
                    HStack{
                        TextField("New Item", text: self.$newTodoitem)
                        Button(action: {
                             let toDoItem = Todoitem(context:self.managedObjectContext)
                            toDoItem.title = self.newTodoitem
                            toDoItem.createdAt = Date()
                            
                            do {
                                try self.managedObjectContext.save()
                            }catch{
                                print(error)
                            }
                            
                            self.newTodoitem = ""
                            
                        }){
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }.font(.headline)
                Section(header: Text("Things to do")){
                    ForEach(self.toDoitems) {todoitem in
                        ToDoitemView(title: todoitem.title!, createdAt: "\(todoitem.createdAt!)")
                    }.onDelete {indexSet in
                        let deleteItem = self.toDoitems[indexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                        
                        do {
                            try self.managedObjectContext.save()
                        }catch{
                            print(error)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Daily To-do-list"))
            .navigationBarItems(trailing: EditButton())
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
  }

