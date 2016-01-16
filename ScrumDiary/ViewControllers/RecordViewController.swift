//
//  RecordViewController.swift
//  ScrumDiary
//
//  Created by Kulkarni, Punit on 1/16/16.
//  Copyright © 2016 Kulkarni, Punit. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {

    var selectedDate: NSDate!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var recordTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        dateLabel.text = selectedDate.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
