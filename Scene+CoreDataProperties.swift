//
//  Scene+CoreDataProperties.swift
//  My-Life-is-a-Movie
//
//  Created by Anthony Torrero Collins on 2/18/16.
//  Copyright © 2016 Anthony Torrero Collins. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Scene {

    @NSManaged var image: NSData?
    @NSManaged var sceneDesc: String?
    @NSManaged var dateShot: String?
    @NSManaged var sceneTitle: String?

}
