//
//  User+CoreDataProperties.swift
//  PokeDex
//
//  Created by user163857 on 8/28/20.
//  Copyright © 2020 user179175. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var id: Int16

}
