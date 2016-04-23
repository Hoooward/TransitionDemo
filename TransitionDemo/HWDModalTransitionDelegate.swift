//
//  HWDModalTransitionDelegate.swift
//  TransitionDemo
//
//  Created by Howard on 16/4/23.
//  Copyright © 2016年 Howard. All rights reserved.
//

import UIKit

class HWDModalTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return OverlayAnimationController()
        //Or
        //        let transitionType = SDETransitionType.ModalTransition(.Presentation)
        //        return SlideAnimationController(type: transitionType)
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //Or
        //        let transitionType = SDETransitionType.ModalTransition(.Dismissal)
        //        return SlideAnimationController(type: transitionType)
        return OverlayAnimationController()
    }
    
    @available(iOS 8.0, *)
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        return OverlayPresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
    
    
}
