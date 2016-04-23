//
//  FirstViewController.swift
//  TransitionDemo
//
//  Created by Howard on 16/4/22.
//  Copyright © 2016年 Howard. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    /*
     从 SecondViewController 复制而来。
    */
    let edgePanGesture = UIScreenEdgePanGestureRecognizer()
    var navigationDelegate: HWDNavigationControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgePanGesture.edges = .Left
        edgePanGesture.addTarget(self, action: #selector(SecondViewController.handleEdgePanGesture(_:)))
        view.addGestureRecognizer(edgePanGesture)
    }

    
    func handleEdgePanGesture(gesture: UIScreenEdgePanGestureRecognizer) {
        let translationX = gesture.translationInView(view).x
        let translationBase: CGFloat = view.frame.width / 3
        let translationAbs = translationX > 0 ? translationX : -translationX
        let percent = translationAbs > translationBase ? 1.0 : translationAbs / translationBase
        
        switch gesture.state {
        case .Began:
        navigationDelegate = self.navigationController?.delegate as?  HWDNavigationControllerDelegate
        navigationDelegate?.interactive = true
        self.navigationController?.popViewControllerAnimated(true)
        case .Changed:
        navigationDelegate?.interactionController.updateInteractiveTransition(percent)
        case .Cancelled, .Ended:
        if percent > 0.5 {
        navigationDelegate?.interactionController.finishInteractiveTransition()
        } else {
        navigationDelegate?.interactionController.cancelInteractiveTransition()
        }
        navigationDelegate?.interactive = false
        default:
        break
        }
        }
    
    
    deinit {
        edgePanGesture.removeTarget(self, action: #selector(SecondViewController.handleEdgePanGesture(_:)))
    }


}
