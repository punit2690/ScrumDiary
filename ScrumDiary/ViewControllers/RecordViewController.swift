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
        
    }
    
    func textViewDidChange(textView: UITextView) {
        
    }
}
