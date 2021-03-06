//
//  CalenderDayViewController.swift
//  ScrumDiary
//
//  Created by Kulkarni, Punit on 12/24/15.
//  Copyright © 2015 Kulkarni, Punit. All rights reserved.
//

import UIKit

class CalenderDayViewController: UIViewController, ASCollectionDelegate, ASCollectionDataSource {
    
    let cellSpacing: CGFloat = 10
    let collectionViewWidth: CGFloat = 320
    
    var cellDataArray = [Int]()
    @IBOutlet weak var colllectionView: ASCollectionNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.colllectionView.view.asyncDataSource = self
        self.colllectionView.view.asyncDelegate = self

        let collectionViewFlowLayout = CollectionViewFlowLayout()
        colllectionView.view.collectionViewLayout = collectionViewFlowLayout
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let viewWidth = collectionViewWidth
        let totalCellWidth: CGFloat = 240 * 5
        let totalSpacingWidth = cellSpacing * (5-1)
        
        let leftInset: CGFloat = (CGFloat)(viewWidth - (totalCellWidth + totalSpacingWidth)) / 2.0
        let rightInset = leftInset
        colllectionView.view.contentOffset.x = -rightInset
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UICollectionViewDataSourc
    
    func collectionView(collectionView: ASCollectionView, nodeForItemAtIndexPath indexPath: NSIndexPath) -> ASCellNode {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
}
