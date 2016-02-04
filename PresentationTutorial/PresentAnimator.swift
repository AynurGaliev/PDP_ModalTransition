//
//  InteractiveManager.swift
//  PresentationTutorial
//
//  Created by Galiev Aynur on 25.07.15.
//  Copyright (c) 2015 Sztanyi Szabolcs. All rights reserved.
//

import UIKit

class PresentAnimator: UIPercentDrivenInteractiveTransition {
   
}

extension PresentAnimator: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {

        var destinationVC   : UIViewController
        
        destinationVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)! as UIViewController

        let containerView = transitionContext.containerView()
        
        destinationVC.view.alpha = 0.0
        destinationVC.view.transform = CGAffineTransformMakeScale(0.1, 0.1)

        containerView!.addSubview(destinationVC.view!)
        
        weak var wself = self
        UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: { () -> Void in
            
            if let _ = wself {
                destinationVC.view.alpha = 1.0
                destinationVC.view.transform = CGAffineTransformIdentity
            }
        }) { (success: Bool) -> Void in
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
    
    func animationEnded(transitionCompleted: Bool) {
        
    }
}

extension PresentAnimator: UIViewControllerTransitioningDelegate {
    
    func animationControllerForPresentedController(presented: UIViewController,
                             presentingController presenting: UIViewController,
                                     sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self
    }
}