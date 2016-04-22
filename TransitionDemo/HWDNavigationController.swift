//
//  HWDNavigationController.swift
//  TransitionDemo
//
//  Created by Howard on 16/4/22.
//  Copyright © 2016年 Howard. All rights reserved.
//

import UIKit

class HWDNavigationController: UINavigationController, UINavigationControllerDelegate{
    
    var HWDDelegate = HWDNavigationControllerDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//       self.delegate = HWDDelegate
        
    }
}
