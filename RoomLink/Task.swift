//
//  Task.swift
//  RoomLink
//
//  Created by Rahul Ajmera on 12/6/16.
//  Copyright © 2016 Rahul Ajmera. All rights reserved.
//

import Foundation
import RealmSwift

class Task: Object {
    
    dynamic var name = ""
    dynamic var createdAt = NSDate()
    dynamic var notes = ""
    dynamic var isCompleted = false
    dynamic var addedBy = ""
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
