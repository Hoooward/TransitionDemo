//
//  HWDAnimationController.swift
//  TransitionDemo
//
//  Created by Howard on 16/4/22.
//  Copyright © 2016年 Howard. All rights reserved.
//

import UIKit

class HWDTransitionController {
    
    enum HWDTransitionType {
        // UINavigationControllerOperation 是枚举类型，有 None，Push， Pop 三种值
        case NavigationTransition(UINavigationControllerOperation)
    }
    
}

class SlideAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    let operation: UINavigationControllerOperation
    
    init(type: UINavigationControllerOperation) {
        operation = type
        super.init()
    }
  
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.9
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard let containerView = transitionContext.containerView(),
        fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
        toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else {
                return
        }
        
        let fromView = fromVC.view
        let toView = toVC.view
        
        //1
        containerView.addSubview(toView)
        
        var translation = containerView.frame.width
        var toViewTransform = CGAffineTransformIdentity
        var fromViewTransform = CGAffineTransformIdentity
        
        translation = operation == .Push ? translation : -translation
        toViewTransform = CGAffineTransformMakeTranslation(translation, 0)
        fromViewTransform = CGAffineTransformMakeTranslation(-translation, 0)
        
        toView.transform = toViewTransform
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            fromView.transform = fromViewTransform
            toView.transform = CGAffineTransformIdentity
            }, completion: { finished in
                fromView.transform = CGAffineTransformIdentity
                toView.transform = CGAffineTransformIdentity
                //2
                let isCancelled = transitionContext.transitionWasCancelled()
                transitionContext.completeTransition(!isCancelled)
        })
    }
}

class HWDNavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return SlideAnimationController(type: operation)
    }
}













