//
//  ListView.swift
//  Todo
//
//  Created by CSUFTitan on 3/16/20.
//  Copyright © 2020 CSUFTitan. All rights reserved.
//

import SwiftUI

struct ListView: View {
    
    var listTitle:String = ""
    var listCreatedAt:String = ""
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                NavigationLink(destination: ContentView2()) {
                    Text(listTitle).font(.headline)
                    Text(listCreatedAt).font(.caption)
                }
            
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(listTitle: "First List", listCreatedAt: "Today")
    }
}
