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
//            Text("Hello world")
            List{
                Section(header: Text("What's next?")){

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
                Section(header: Text("To DO's")){
                    ForEach(self.toDoitems) {toDoitem in
                        ToDoitemView(title: toDoitem.title!, createdAt: "\(toDoitem.createdAt!)")
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
}
