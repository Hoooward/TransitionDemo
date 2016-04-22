//
//  SecondViewController.swift
//  TransitionDemo
//
//  Created by Howard on 16/4/22.
//  Copyright © 2016年 Howard. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let edgePanGesture = UIScreenEdgePanGestureRecognizer()
    var navigationDelegate: HWDNavigationControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgePanGesture.edges = .Left
        edgePanGesture.addTarget(self, action: #selector(SecondViewController.handleEdgePanGesture(_:)))
        view.addGestureRecognizer(edgePanGesture)
    }
    
    func handleEdgePanGesture(gesture: UIScreenEdgePanGestureRecognizer) {
        print("EdgePanGesture has resbounded")
    }

}
