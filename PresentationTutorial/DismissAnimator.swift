//
//  DismissAnimator.swift
//  PresentationTutorial
//
//  Created by Galiev Aynur on 29.07.15.
//  Copyright (c) 2015 Sztanyi Szabolcs. All rights reserved.
//

import UIKit

class DismissAnimator: UIPercentDrivenInteractiveTransition {
   
}


extension DismissAnimator: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 2.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        var sourceVC   : UIViewController
        
        sourceVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)! as UIViewController

        weak var wself = self
        UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: { () -> Void in
            
            if let sself = wself {
                sourceVC.view.alpha = 0.0
                sourceVC.view.transform = CGAffineTransformMakeScale(0.1, 0.1)
            }
            
        }) { (success: Bool) -> Void in
                
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
    
    func animationEnded(transitionCompleted: Bool) {
        
    }
}

extension DismissAnimator: UIViewControllerTransitioningDelegate {
    
    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
}