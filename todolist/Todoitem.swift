//
//  Todoitem.swift
//  todolist
//
//  Created by XIN on 10/15/19.
//  Copyright © 2019 XIN. All rights reserved.
//

import Foundation
import CoreData

public class Todoitem: NSManagedObject, Identifiable{
    @NSManaged public var createdAt: Date?
    @NSManaged public var title: String?
    
}

extension Todoitem {
    static func getAllTodoitem() -> NSFetchRequest <Todoitem> {
        let request:NSFetchRequest<Todoitem> = Todoitem.fetchRequest() as!
            NSFetchRequest<Todoitem>
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
