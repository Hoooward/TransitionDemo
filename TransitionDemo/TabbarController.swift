//
//  TabbarController.swift
//  TransitionDemo
//
//  Created by Howard on 16/4/23.
//  Copyright © 2016年 Howard. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController {
    
    private var panGesture: UIPanGestureRecognizer = UIPanGestureRecognizer()
    private let tabBarVCDelegate = HWDTabBarControllerDelegate()
    private var subViewControllerCount: Int {
        let count = viewControllers != nil ? viewControllers!.count : 0
        return count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = tabBarVCDelegate
        self.tabBar.tintColor = UIColor.greenColor()
        
        panGesture.addTarget(self, action: #selector(TabbarController.handlePan(_:)))
        view.addGestureRecognizer(panGesture)
    }
    
    
    func handlePan(panGesture: UIPanGestureRecognizer) {
        let translationX = panGesture.translationInView(view).x
        let translationAbs = translationX > 0 ? translationX : -translationX
        let progress = translationAbs / view.frame.width
        switch panGesture.state {
        case .Began:
            tabBarVCDelegate.interaction = true
            let velocityX = panGesture.velocityInView(view).x
            print("Velocityx = \(velocityX)")
            if velocityX < 0 {
                if selectedIndex < subViewControllerCount - 1 {
                    selectedIndex += 1
                }
            } else {
                if selectedIndex > 0 {
                    selectedIndex -= 1
                }
            }
        case .Changed:
            tabBarVCDelegate.interactionController.updateInteractiveTransition(progress)
        case .Cancelled, .Ended:
            if progress > 0.3 {
                tabBarVCDelegate.interactionController.completionSpeed = 0.99
                tabBarVCDelegate.interactionController.finishInteractiveTransition()
            } else {
                //转场取消后，UITabBarController 自动恢复了 selectedIndex 的值，不需要我们手动恢复。
                tabBarVCDelegate.interactionController.completionSpeed = 0.99
                tabBarVCDelegate.interactionController.cancelInteractiveTransition()
            }
            tabBarVCDelegate.interaction = false
        default:
            break
        }
        
    }
}
