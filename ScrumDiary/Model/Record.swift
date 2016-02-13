//
//  Record.swift
//  ScrumDiary
//
//  Created by Kulkarni, Punit on 1/16/16.
//  Copyright © 2016 Kulkarni, Punit. All rights reserved.
//

import UIKit
import CoreData

class Record: NSObject {
    
    var date: NSDate!
    var note: String!
    
    func save() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let entity =  NSEntityDescription.entityForName("Record",
            inManagedObjectContext:managedContext)
        
        let record = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext: managedContext)
        
        record.setValue(note, forKey: "note")
        record.setValue(date, forKey: "date")
        
        do {
            try managedContext.save()

        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    class func getRecordForDate(date: NSDate!) -> Record! {
        
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entityForName("Record",
            inManagedObjectContext:managedContext)
        let predicate = NSPredicate(format:"%@ = date", date)
        let fetch = NSFetchRequest()
        fetch.entity = entity
        fetch.predicate = predicate
        
        do {
            let fetchedObjects = try managedContext.executeFetchRequest(fetch)
            if fetchedObjects.count > 0 {
                let obj = fetchedObjects[0] as! NSManagedObject
                let dict = obj.entity.attributesByName as NSDictionary
                let keys: NSArray = dict.allKeys
                let dictionary = obj.dictionaryWithValuesForKeys(keys as! [String])
                print(dictionary.description)
                
                let record = Record()
                
                if let note = dictionary["note"] as? String {
                    record.note = note
                }
                if let date = dictionary["date"] as? NSDate {
                    record.date = date
                }
                return record
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
