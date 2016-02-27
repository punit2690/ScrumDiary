//
//  Record.swift
//  ScrumDiary
//
//  Created by Kulkarni, Punit on 2/14/16.
//  Copyright © 2016 Kulkarni, Punit. All rights reserved.
//

import Foundation
import CoreData

@objc(Record)
class Record: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    class func initNewRecord() -> Record {
        
        let managedContext = CoreDataManager.defaultManager.managedObjectContext
        let entity =  NSEntityDescription.entityForName("Record",
            inManagedObjectContext:managedContext)
        return Record.init(entity: entity!, insertIntoManagedObjectContext: managedContext)
    }

    class func getRecordForDate(date: NSDate!) -> Record! {
        
        let managedContext = CoreDataManager.defaultManager.managedObjectContext
        let entity =  NSEntityDescription.entityForName("Record",
            inManagedObjectContext:managedContext)
        let predicate = NSPredicate(format:"%@ = date", date)
        let fetch = NSFetchRequest()
        fetch.entity = entity
        fetch.predicate = predicate
        
        do {
            let fetchedObjects = try managedContext.executeFetchRequest(fetch)
            if fetchedObjects.count > 0 {
                let obj = fetchedObjects[0] as! Record
                return obj
            }
            else {
                //Error
            }
        }
        catch {
            
        }
        return nil
    }
}
