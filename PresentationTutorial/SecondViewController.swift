//
//  SecondViewController.swift
//  PresentationTutorial
//
//  Created by Galiev Aynur on 25.07.15.
//  Copyright (c) 2015 Sztanyi Szabolcs. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    private var animationManager: DismissAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.animationManager = DismissAnimator()
        
        let gesture = UIScreenEdgePanGestureRecognizer(target: self, action: "pan:")
        gesture.edges  = UIRectEdge.Left
        self.view.addGestureRecognizer(gesture)
    }
    
    func pan(sender: UIScreenEdgePanGestureRecognizer) {
        
        let point: CGPoint = sender.translationInView(self.presentingViewController!.view)
        
        switch sender.state {
            
            case UIGestureRecognizerState.Began:
                
                self.transitioningDelegate = self.animationManager
                self.modalPresentationStyle = UIModalPresentationStyle.Custom
                self.dismissViewControllerAnimated(true, completion: nil)
                
            case UIGestureRecognizerState.Changed:

                self.animationManager.updateInteractiveTransition(point.x/UIScreen.mainScreen().bounds.size.width)
                
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
