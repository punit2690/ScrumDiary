//
//  collectionViewFlowLayout.swift
//  ScrumDiary
//
//  Created by Kulkarni, Punit on 12/26/15.
//  Copyright © 2015 Kulkarni, Punit. All rights reserved.
//

import UIKit

class CollectionViewFlowLayout: UICollectionViewFlowLayout, UICollectionViewDelegateFlowLayout {

    let height: CGFloat = 320
    let width: CGFloat = 240
    
    override init() {
        super.init()
        self.itemSize = CGSizeMake(width, height)
        self.scrollDirection = UICollectionViewScrollDirection.Horizontal
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
