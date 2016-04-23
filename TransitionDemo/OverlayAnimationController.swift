//
//  OverlayAnimationController.swift
//  TransitionDemo
//
//  Created by Howard on 16/4/22.
//  Copyright © 2016年 Howard. All rights reserved.
//

import UIKit

class OverlayAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard let containerView = transitionContext.containerView(),
        fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
            toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else {
                return
        }
        
        let fromView = fromVC.view
        let toView = toVC.view
        
        if toVC.isBeingPresented() {
            //1 
            containerView.addSubview(toView)
            
            
            // 设置 presentedView 和 暗背景视图 dimmingView 的初始尺寸
            let toViewWidth = containerView.frame.width * 2 / 3
            let toViewHeight = containerView.frame.height * 2 / 3
            toView.center = containerView.center
            toView.bounds = CGRect(x: 0, y: 0, width: 1, height: toViewHeight)
            
            if #available(iOS 8, *) {
                UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0, options: .CurveEaseInOut, animations: {
                    _ in
                    toView.bounds = CGRect(x: 0, y: 0, width: toViewWidth, height: toViewHeight)
                    }, completion: { _ in
                        
                        let isCancelled = transitionContext.transitionWasCancelled()
                        transitionContext.completeTransition(!isCancelled)
                })
                
            } else {
                let dimmingView = UIView()
                containerView.insertSubview(dimmingView, belowSubview: toView)
                dimmingView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
                dimmingView.center = containerView.center
                dimmingView.bounds = CGRect(x: 0, y: 0, width: toViewWidth, height: toViewHeight)
                
                UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0, options: .CurveEaseInOut, animations: {
                    dimmingView.bounds = containerView.bounds
                    toView.bounds = CGRect(x: 0, y: 0, width: toViewWidth, height: toViewHeight)
                    }, completion: { _ in
                        
                        let isCancelled = transitionContext.transitionWasCancelled()
                        transitionContext.completeTransition(!isCancelled)
                        
                })

            }
            
        }
        
        if fromVC.isBeingDismissed() {
            let fromViewHeight = fromView.frame.height
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
                fromView.bounds = CGRect(x: 0, y: 0, width: 1, height: fromViewHeight)
                }, completion: { _ in
                    let isCancelled = transitionContext.transitionWasCancelled()
                    transitionContext.completeTransition(!isCancelled)
            })
        }
        
    }
}






