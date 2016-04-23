//
//  RootTableViewController.swift
//  TransitionDemo
//
//  Created by Howard on 16/4/22.
//  Copyright © 2016年 Howard. All rights reserved.
//

import UIKit

class RootTableViewController: UITableViewController {
    let HWDNavigationDelegate = HWDNavigationControllerDelegate()
    let ModalViewControllerDelegate = HWDModalTransitionDelegate()

}

extension RootTableViewController: SegueHandlerType {
    

    
    enum SegueIdentifier: String {
        case NavigationTransition = "ShowNavigationTransition"
        case ModalTransition = "ShowModalViewController"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segueIdentifierForSegue(segue) {
        case .NavigationTransition:
            /*
             设置 Delegate 
             可以在StoryBoard 中添加 Object 
             也可以创建NavigationController 的子类在初始化方法中设置
             也可以在 prepareForSegue 中设置Delegate
             */
            let tableViewController = segue.sourceViewController as! UITableViewController
            let navigation = tableViewController.navigationController as! HWDNavigationController
            navigation.delegate = HWDNavigationDelegate
            
        case .ModalTransition:
            /*
             .FullScreen 的时候，presentingView 的移除和添加由 UIKit 负责，在 presentation 转场结束后被移除，dismissal 转场结束时重新回到原来的位置；
             .Custom 的时候，presentingView 依然由 UIKit 负责，但 presentation 转场结束后不会被移除。
             */

            let toVC = segue.destinationViewController as! PresentedViewController
            toVC.transitioningDelegate = ModalViewControllerDelegate
            toVC.modalPresentationStyle = .Custom
            

        }
    }
}

