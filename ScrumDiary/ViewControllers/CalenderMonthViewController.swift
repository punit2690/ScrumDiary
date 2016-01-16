//
//  CalenderMonthViewController.swift
//  ScrumDiary
//
//  Created by Kulkarni, Punit on 12/24/15.
//  Copyright © 2015 Kulkarni, Punit. All rights reserved.
//

import UIKit

class CalenderMonthViewController: UIViewController, FSCalendarDelegate {

    @IBOutlet weak var fsCalendarView: FSCalendar!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calendar(calendar: FSCalendar!, didSelectDate date: NSDate!) {
        self.performSegueWithIdentifier("ShowRecord", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var recordViewController = segue.destinationViewController as! RecordViewController
        recordViewController.selectedDate = fsCalendarView.selectedDate
    }
}
