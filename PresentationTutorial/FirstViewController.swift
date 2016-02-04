//
//  FirstViewController.swift
//  PresentationTutorial
//
//  Created by Galiev Aynur on 25.07.15.
//  Copyright (c) 2015 Sztanyi Szabolcs. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    private var animationManager: PresentAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.animationManager = PresentAnimator()

        let gesture = UIScreenEdgePanGestureRecognizer(target: self, action: "pan:")
        gesture.edges  = UIRectEdge.Right
        self.view.addGestureRecognizer(gesture)
    }
    
    func pan(sender: UIScreenEdgePanGestureRecognizer) {
        
        let point: CGPoint = sender.translationInView(self.view)
        
        switch sender.state {
            
            case UIGestureRecognizerState.Began:
            
                let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("SecondViewController") as! SecondViewController
                secondViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
                secondViewController.transitioningDelegate = self.animationManager
                self.presentViewController(secondViewController, animated: true, completion: nil)
            
            case UIGestureRecognizerState.Changed:

                self.animationManager.updateInteractiveTransition(-point.x/sender.view!.frame.size.width)
            
            case UIGestureRecognizerState.Cancelled:

                let centerX: CGFloat = CGRectGetMidX(sender.view!.frame)
                if centerX < point.x {
                    self.animationManager.finishInteractiveTransition()
                } else {
                    self.animationManager.cancelInteractiveTransition()
                }
            
            case UIGestureRecognizerState.Ended:
            
                let centerX: CGFloat = CGRectGetMidX(sender.view!.frame)
                if centerX < fabs(point.x) {
                    self.animationManager.finishInteractiveTransition()
                } else {
                    self.animationManager.cancelInteractiveTransition()
                }
            default:
                print("Not implemented!")
        }
        
    }
}
