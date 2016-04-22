//
//  RootTableViewController.swift
//  TransitionDemo
//
//  Created by Howard on 16/4/22.
//  Copyright © 2016年 Howard. All rights reserved.
//

import UIKit

class RootTableViewController: UITableViewController {
    var HWDNavigationDelegate = HWDNavigationControllerDelegate()

}

extension RootTableViewController: SegueHandlerType {
    

    
    enum SegueIdentifier: String {
        case NavigationTransition = "ShowNavigationTransition"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segueIdentifierForSegue(segue) {
        case .NavigationTransition:
            
            let tableViewController = segue.sourceViewController as! UITableViewController
            let navigation = tableViewController.navigationController as! HWDNavigationController
            navigation.delegate = HWDNavigationDelegate

        }
    }
}

