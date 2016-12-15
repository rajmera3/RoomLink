//
//  TaskList.swift
//  RoomLink
//
//  Created by Rahul Ajmera on 12/6/16.
//  Copyright © 2016 Rahul Ajmera. All rights reserved.
//

import Foundation
import RealmSwift

class TaskList: Object {
    dynamic var name = ""
    dynamic var createdAt = NSDate()
    let tasks = List<Task>()
    
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
