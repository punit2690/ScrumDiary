//
//  RecordViewController.swift
//  ScrumDiary
//
//  Created by Kulkarni, Punit on 1/16/16.
//  Copyright © 2016 Kulkarni, Punit. All rights reserved.
//

import UIKit

protocol RecordViewControllerDelegate {
    
    func deselectDate(date:NSDate)
}

class RecordViewController: UIViewController, UITextViewDelegate {

    var selectedRecord: Record!
    var delegate: RecordViewControllerDelegate!
    var rightButton: UIBarButtonItem!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var recordTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dateLabel.text = selectedRecord.date!.description
        recordTextView.text = selectedRecord.note
        self.recordTextView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        if selectedRecord.note?.characters.count == 0 || selectedRecord.note == nil {
            self.delegate.deselectDate(selectedRecord.date!)
            CoreDataManager.defaultManager.managedObjectContext.deleteObject(selectedRecord)
        }
        CoreDataManager.defaultManager.saveContext()
        super.viewWillDisappear(animated)
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
        selectedRecord.note = textView.text
    }
}
