//
//  DetailPresentationController.swift
//  PresentationTutorial
//
//  Created by Aynur Galiev on 20/07/15.
//  Copyright (c) 2014 Aynur Galiev. All rights reserved.
//

import UIKit

class DetailPresentationController: UIPresentationController {
    
    var backgroundView: UIView!
    
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
        setupbackgroundView()
    }
    
    func setupbackgroundView() {
        backgroundView = UIView(frame: presentingViewController.view.bounds)
        
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark)) as UIVisualEffectView
        visualEffectView.frame = backgroundView.bounds
        backgroundView.addSubview(visualEffectView)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: "backgroundViewTapped:")
        backgroundView.addGestureRecognizer(tapRecognizer)
    }
    
    func backgroundViewTapped(tapRecognizer: UITapGestureRecognizer) {
        presentingViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func presentationTransitionWillBegin() {
        let containerView = self.containerView
        let presentedViewController = self.presentedViewController
        
        backgroundView.frame = containerView!.bounds
        backgroundView.alpha = 0.0
        
        containerView!.insertSubview(backgroundView, atIndex: 0)
        presentedViewController.transitionCoordinator()?.animateAlongsideTransition({ (coordinatorContext) -> Void in
            self.backgroundView.alpha = 1.0
            }, completion: nil)
    }
    
    override func dismissalTransitionWillBegin() {
        
        self.presentedViewController.transitionCoordinator()?.animateAlongsideTransition({ (coordinatorContext) -> Void in
            self.backgroundView.alpha = 0.0
            }, completion: nil)
    }
    
    override func containerViewWillLayoutSubviews() {
        backgroundView.frame = containerView!.bounds
        presentedView()!.frame = frameOfPresentedViewInContainerView()
    }
    
    override func sizeForChildContentContainer(container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        
        return CGSizeMake(parentSize.width - 40.0, parentSize.height - 80.0)
    }
    
    override func frameOfPresentedViewInContainerView() -> CGRect {
        var presentedViewFrame = CGRectZero
        let containerBounds = containerView!.bounds
        
        let contentContainer = presentedViewController
        presentedViewFrame.size = sizeForChildContentContainer(contentContainer, withParentContainerSize: containerBounds.size)
        presentedViewFrame.origin.x = 20.0
        presentedViewFrame.origin.y = 40.0
        
        return presentedViewFrame
    }
}