//
//  HWDTabBarControllerDelegate.swift
//  TransitionDemo
//
//  Created by Howard on 16/4/23.
//  Copyright © 2016年 Howard. All rights reserved.
//

import UIKit

class HWDTabBarControllerDelegate: NSObject, UITabBarControllerDelegate {
    
    var interaction = false
    let interactionController = UIPercentDrivenInteractiveTransition()
    
    func tabBarController(tabBarController: UITabBarController, animationControllerForTransitionFromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        let fromIndex = tabBarController.viewControllers?.indexOf(fromVC)!
        let toIndex = tabBarController.viewControllers?.indexOf(toVC)!
        
        let tabChangeDirection: TabOperationDirection = toIndex < fromIndex ? .Left : .Right
        let transitionType = HWDTransitionType.TabTransition(tabChangeDirection)
        
        return SlideAnimationController(type: transitionType)
    }
    
    func tabBarController(tabBarController: UITabBarController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interaction ? interactionController : nil
    }
}
