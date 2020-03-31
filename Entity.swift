//
//  Entity.swift
//  Todo
//
//  Created by CSUFTitan on 3/16/20.
//  Copyright © 2020 CSUFTitan. All rights reserved.
//

import Foundation
import CoreData

public class Entity: NSManagedObject, Identifiable {
    @NSManaged public var listCreatedAt: Date?
    @NSManaged public var listTitle: String?
}

extension Entity {
    static func getAllLists() -> NSFetchRequest<Entity> {
        let request:NSFetchRequest<Entity> = Entity.fetchRequest() as! NSFetchRequest<Entity>
        
        let sortDescriptor2 = NSSortDescriptor(key: "listCreatedAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptor2]
        
        return request
    }
}
