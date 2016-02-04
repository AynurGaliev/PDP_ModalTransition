//
//  FirstCollectionViewController.swift
//  PresentationTutorial
//
//  Created by Galiev Aynur on 29.07.15.
//  Copyright (c) 2015 Sztanyi Szabolcs. All rights reserved.
//

import UIKit


class FirstCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "SmallCell")
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SmallCell", forIndexPath: indexPath) 
        cell.backgroundColor = UIColor.redColor()
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let selfLayout = self.collectionViewLayout as! UICollectionViewFlowLayout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(selfLayout.itemSize.width*1.5, selfLayout.itemSize.height*1.5)
        let secondCollectionViewController = FirstCollectionViewController(collectionViewLayout: layout)
        secondCollectionViewController.useLayoutToLayoutNavigationTransitions = true
        self.navigationController?.pushViewController(secondCollectionViewController, animated: true)
    }
}
