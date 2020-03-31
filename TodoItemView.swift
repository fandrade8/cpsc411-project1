//
//  TodoItemView.swift
//  Todo
//
//  Created by CSUFTitan on 3/9/20.
//  Copyright © 2020 CSUFTitan. All rights reserved.
//

import SwiftUI

struct TodoItemView: View {
    var title:String = ""
    var createdAt:String = ""
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                    Text(title).font(.headline)
                    Text(createdAt).font(.caption)
            }
        }
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemView(title: "First List", createdAt: "Today")
    }
}
