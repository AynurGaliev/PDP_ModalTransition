//
//  DetailPresentationController.swift
//  PresentationTutorial
//
//  Created by Aynur Galiev on 20/07/15.
//  Copyright (c) 2014 Aynur Galiev. All rights reserved.
//

import UIKit

class PresentationManager: NSObject, UIViewControllerTransitioningDelegate {
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        let presentationController = DetailPresentationController(presentedViewController: presented, presentingViewController: source)
        return presentationController;
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TransitionPresentationAnimator()
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TransitionDismissAnimator()
    }
    
//    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        return TransitionPresentationAnimator()
//    }
//    
//    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        return TransitionDismissAnimator()
//    }
}