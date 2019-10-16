//
//  ToDoitemView.swift
//  todolist
//
//  Created by XIN on 10/16/19.
//  Copyright © 2019 XIN. All rights reserved.
//

import SwiftUI

struct ToDoitemView: View {
    var title:String = ""
    var createdAt:String = ""
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(title)
                 .font(.headline)
                Text(createdAt)
                 .font(.caption)
            }
        }
    }
}

struct ToDoitemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoitemView(title:"My great todo",createdAt: "Today")
    }
}
