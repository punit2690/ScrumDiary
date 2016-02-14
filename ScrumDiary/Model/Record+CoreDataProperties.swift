//
//  Record+CoreDataProperties.swift
//  ScrumDiary
//
//  Created by Kulkarni, Punit on 2/14/16.
//  Copyright © 2016 Kulkarni, Punit. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Record {

    @NSManaged var date: NSDate?
    @NSManaged var note: String?

}
