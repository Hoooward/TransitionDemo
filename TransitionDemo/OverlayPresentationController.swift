//
//  OverlayPresentationController.swift
//  TransitionDemo
//
//  Created by Howard on 16/4/23.
//  Copyright © 2016年 Howard. All rights reserved.
//

import UIKit

@available(iOS 8, *)
class OverlayPresentationController: UIPresentationController {
    let dimmingView = UIView()
    
    override func presentationTransitionWillBegin() {
        containerView?.addSubview(dimmingView)
        
        let dimmingViewInitailWidth = containerView!.frame.width * 2 / 3
        let dimmingViewInitailHeight = containerView!.frame.height * 2 / 3
        dimmingView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        dimmingView.center = containerView!.center
        dimmingView.bounds = CGRect(x: 0, y: 0, width: dimmingViewInitailWidth, height: dimmingViewInitailHeight)
        
        presentedViewController.transitionCoordinator()?.animateAlongsideTransition({
            _ in
            self.dimmingView.bounds = self.containerView!.bounds
            
            }, completion: nil)
    }
    
    override func dismissalTransitionWillBegin() {
        presentedViewController.transitionCoordinator()?.animateAlongsideTransition({
            _ in
            self.dimmingView.alpha = 0.0
            }, completion: nil)
    }
    
    override func containerViewWillLayoutSubviews() {
        dimmingView.center = containerView!.center
        dimmingView.bounds = containerView!.bounds
        
        let width = containerView!.frame.width * 2 / 3
        let height = containerView!.frame.height * 2 / 3
        presentedView()?.center = containerView!.center
        presentedView()?.bounds = CGRect(x: 0, y: 0, width: width, height: height)
    }

}
