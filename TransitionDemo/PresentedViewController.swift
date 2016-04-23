//
//  PresentedViewController.swift
//  TransitionDemo
//
//  Created by Howard on 16/4/23.
//  Copyright © 2016年 Howard. All rights reserved.
//

import UIKit

class PresentedViewController: UIViewController {
    
    let presentTransitionDelegate = HWDModalTransitionDelegate()
    
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var dismissButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissButton.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let widthConstraint = inputTextField.constraints.filter({
        constraint in
            constraint.identifier == "Width"
        }).first
        
        widthConstraint?.constant = view.frame.width * 2 / 3
        
        UIView.animateWithDuration(0.3, animations: {
            self.dismissButton.alpha = 1
            self.inputTextField.layoutIfNeeded()
        })
    }
    
    @IBAction func dismiss(sender: AnyObject) {
        var applyTransform = CGAffineTransformMakeRotation(3 * CGFloat(M_PI))
        applyTransform = CGAffineTransformScale(applyTransform, 0.1, 0.1)
        
        let widthConstraint = inputTextField.constraints.filter({ constraint in
            constraint.identifier == "Width"
        }).first
        
        widthConstraint?.constant = 0
        
        UIView.animateWithDuration(0.4, animations: {
        
            self.dismissButton.transform = applyTransform
            self.inputTextField.layoutIfNeeded()
            }, completion: { _ in
                self.dismissViewControllerAnimated(true, completion: nil)
        })
    }
    
}
