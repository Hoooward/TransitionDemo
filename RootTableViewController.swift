//
//  RootTableViewController.swift
//  TransitionDemo
//
//  Created by Howard on 16/4/22.
//  Copyright © 2016年 Howard. All rights reserved.
//

import UIKit

class RootTableViewController: UITableViewController {

}

extension RootTableViewController: SegueHandlerType {
    
    
    enum SegueIdentifier: String {
        case NavigationTransition = "ShowNavigationTransition"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segueIdentifierForSegue(segue) {
        case .NavigationTransition:
            break
        }
    }
}

