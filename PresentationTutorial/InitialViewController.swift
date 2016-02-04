//
//  InitialViewController.swift
//  PresentationTutorial
//
//  Created by Galiev Aynur on 29.07.15.
//  Copyright (c) 2015 Sztanyi Szabolcs. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    @IBAction func show(sender: AnyObject) {
        
        //self.navigationController?.delegate = nil
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(30, 30)
        let first = FirstCollectionViewController(collectionViewLayout: layout)
        first.useLayoutToLayoutNavigationTransitions = false
        self.navigationController?.pushViewController(first, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
