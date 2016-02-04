//
//  DetailPresentationController.swift
//  PresentationTutorial
//
//  Created by Aynur Galiev on 20/07/15.
//  Copyright (c) 2014 Aynur Galiev. All rights reserved.
//
import UIKit

class ViewController: UIViewController {

    let detailTransitioningDelegate: PresentationManager = PresentationManager()
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailViewController = segue.destinationViewController as! DetailViewController
        detailViewController.transitioningDelegate = detailTransitioningDelegate
        detailViewController.modalPresentationStyle = .Custom
    }

}
