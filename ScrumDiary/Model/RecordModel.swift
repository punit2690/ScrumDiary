//
//  Record.swift
//  ScrumDiary
//
//  Created by Kulkarni, Punit on 1/16/16.
//  Copyright © 2016 Kulkarni, Punit. All rights reserved.
//

//import UIKit
//import CoreData
//
//class RecordModel: NSObject {
//    
//    var date: NSDate!
//    var note: String!
//    var recordObject: NSManagedObject!
//    
//    func save() {
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let managedContext = appDelegate.managedObjectContext
//        
//        let entity =  NSEntityDescription.entityForName("Record",
//            inManagedObjectContext:managedContext)
//        
//        if (recordObject == nil) {
//            recordObject = NSManagedObject(entity: entity!,
//            insertIntoManagedObjectContext: managedContext)
//        }
//        
//        recordObject.setValue(note, forKey: "note")
//        recordObject.setValue(date, forKey: "date")
//        
//        appDelegate.saveContext()
//    }
//    
//    class func getRecordForDate(date: NSDate!) -> RecordModel! {
//        
//        let appDelegate =
//        UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let managedContext = appDelegate.managedObjectContext
//        let entity =  NSEntityDescription.entityForName("Record",
//            inManagedObjectContext:managedContext)
//        let predicate = NSPredicate(format:"%@ = date", date)
//        let fetch = NSFetchRequest()
//        fetch.entity = entity
//        fetch.predicate = predicate
//        
//        do {
//            let fetchedObjects = try managedContext.executeFetchRequest(fetch)
//            if fetchedObjects.count > 0 {
//                let obj = fetchedObjects[0] as! NSManagedObject
//                let dict = obj.entity.attributesByName as NSDictionary
//                let keys: NSArray = dict.allKeys
//                let dictionary = obj.dictionaryWithValuesForKeys(keys as! [String])
//                print(dictionary.description)
//                
//                let record = RecordModel()
//                
//                if let note = dictionary["note"] as? String {
//                    record.note = note
//                }
//                if let date = dictionary["date"] as? NSDate {
//                    record.date = date
//                }
//                record.recordObject = obj
//                
//                return record
//            }
//            else {
//                //Error
//            }
//        }
//        catch {
//            
//        }
//        
//        return nil
//    }
//}
