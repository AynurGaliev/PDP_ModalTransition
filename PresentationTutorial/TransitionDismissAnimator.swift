//
//  DetailPresentationController.swift
//  PresentationTutorial
//
//  Created by Aynur Galiev on 20/07/15.
//  Copyright (c) 2014 Aynur Galiev. All rights reserved.
//
import UIKit

class TransitionDismissAnimator : NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.3
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        
        let animationDuration = self .transitionDuration(transitionContext)
        
        UIView.animateWithDuration(animationDuration, animations: { () -> Void in
            fromViewController.view.alpha = 0.0
            fromViewController.view.transform = CGAffineTransformMakeScale(0.1, 0.1)
            }) { (finished) -> Void in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
}
