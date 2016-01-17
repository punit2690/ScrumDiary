//
//  RecordViewController.swift
//  ScrumDiary
//
//  Created by Kulkarni, Punit on 1/16/16.
//  Copyright © 2016 Kulkarni, Punit. All rights reserved.
//

import UIKit
import CoreData

class RecordViewController: UIViewController, UITextViewDelegate {

    var selectedDate: NSDate!
    var rightButton: UIBarButtonItem!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var recordTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dateLabel.text = selectedDate.description
        self.recordTextView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        rightButton = UIBarButtonItem.init(title: "Done", style: UIBarButtonItemStyle.Done, target: recordTextView, action: "resignFirstResponder")
        self.navigationItem.rightBarButtonItem = rightButton
        return true
    }
    
    func textViewShouldEndEditing(textView: UITextView) -> Bool {
        rightButton = nil
        return true
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity =  NSEntityDescription.entityForName("Record",
            inManagedObjectContext:managedContext)
        
        let record = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext: managedContext)
        
        //3
        record.setValue(textView.text, forKey: "note")
        record.setValue(selectedDate, forKey: "date")
        
        //4
        do {
            try managedContext.save()
            //5
//            record.append(person)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func textViewDidChange(textView: UITextView) {
        
    }
}
