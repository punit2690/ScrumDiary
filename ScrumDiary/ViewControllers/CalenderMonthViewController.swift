//
//  CalenderMonthViewController.swift
//  ScrumDiary
//
//  Created by Kulkarni, Punit on 12/24/15.
//  Copyright © 2015 Kulkarni, Punit. All rights reserved.
//

import UIKit
import CoreData

class CalenderMonthViewController: UIViewController, FSCalendarDelegate, RecordViewControllerDelegate {

    var records = [NSManagedObject]()
    var selectedDate :NSDate?
    
    @IBOutlet weak var fsCalendarView: FSCalendar!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fsCalendarView.allowsMultipleSelection = true
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //TODO: Find and fix optional checks if any
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { [weak self] in
            self?.records = CoreDataManager.defaultManager.getSelectedDates()
            for record in (self?.records)! {
                let date: NSDate = record.valueForKey("date") as! NSDate
                
                dispatch_async(dispatch_get_main_queue(), { [weak self] in
                    self?.fsCalendarView.selectDate(date)
                    })
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let recordViewController = segue.destinationViewController as! RecordViewController
        
        var record = Record.getRecordForDate(self.selectedDate)
        if (record == nil) {
            record = Record.initNewRecord()
            record.date = self.selectedDate
        }
        recordViewController.selectedRecord = record
        recordViewController.delegate = self
    }
    
    func calendar(calendar: FSCalendar!, shouldSelectDate date: NSDate!) -> Bool {
        self.selectedDate = date
        self.performSegueWithIdentifier("ShowRecord", sender: self)
        return false
    }
    
    func calendar(calendar: FSCalendar!, shouldDeselectDate date: NSDate!) -> Bool {
        self.selectedDate = date
        self.performSegueWithIdentifier("ShowRecord", sender: self)
        return false
    }
    
    func deselectDate(date: NSDate) {
        self.fsCalendarView.deselectDate(date)
    }
}
