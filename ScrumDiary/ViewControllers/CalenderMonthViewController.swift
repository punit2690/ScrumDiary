//
//  CalenderMonthViewController.swift
//  ScrumDiary
//
//  Created by Kulkarni, Punit on 12/24/15.
//  Copyright © 2015 Kulkarni, Punit. All rights reserved.
//

import UIKit
import CoreData

class CalenderMonthViewController: UIViewController, FSCalendarDelegate {

    var records = [NSManagedObject]()
    @IBOutlet weak var fsCalendarView: FSCalendar!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        
        //TODO: Find and fix optional checks if any
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { [weak self] in
            //1
            let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
            
            let managedContext = appDelegate.managedObjectContext
            
            //2
            let fetchRequest = NSFetchRequest(entityName: "Record")
            
            //3
            do {
                let results =
                try managedContext.executeFetchRequest(fetchRequest)
                self?.records = results as! [NSManagedObject]
                
                for record in (self?.records)! {
                    let date: NSDate = record.valueForKey("date") as! NSDate
                    
                    dispatch_async(dispatch_get_main_queue(), { [weak self] in
                        self?.fsCalendarView.selectDate(date)
                    })
                }
            } catch let error as NSError {
                print("Could not fetch \(error), \(error.userInfo)")
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calendar(calendar: FSCalendar!, didSelectDate date: NSDate!) {
        self.performSegueWithIdentifier("ShowRecord", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let recordViewController = segue.destinationViewController as! RecordViewController
        recordViewController.selectedDate = fsCalendarView.selectedDate
    }
}
