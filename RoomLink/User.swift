//
//  User.swift
//  RoomLink
//
//  Created by Rahul Ajmera on 12/14/16.
//  Copyright © 2016 Rahul Ajmera. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    
    dynamic var email = ""
    dynamic var name = ""
    dynamic var uid = ""
    dynamic var password = ""
    dynamic var houseid = ""
    //dynamic var tasks = Task()?
    
    
    
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
