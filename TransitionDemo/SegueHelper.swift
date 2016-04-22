//
//  SegueHelper.swift
//  TransitionDemo
//
//  Created by Howard on 16/4/22.
//  Copyright © 2016年 Howard. All rights reserved.
//

import UIKit

/*
 这个协议的方法来自 WWDC 的 411， 可以在某个视图控制器需要多个 segue 并且需要在触发 segue时 准备一些属性。
 遵循此协议 需要定义一个 SegueIdentifier 的枚举类型对应值为 String。 包含所有 segue 的 identifier。
 此 Demo 使用此协议的类时 RootTableViewController
 
 参考 https://www.natashatherobot.com/protocol-oriented-segue-identifiers-swift/
 
 */

protocol SegueHandlerType {
    associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHandlerType where
            Self: UIViewController,
            SegueIdentifier.RawValue == String {
    
    func performSegueWithIdentifier(segueIdentifier: SegueIdentifier, sender: AnyObject?) {
        performSegueWithIdentifier(segueIdentifier.rawValue, sender: sender)
    }
    
    func segueIdentifierForSegue(segue: UIStoryboardSegue) -> SegueIdentifier {
        guard let identifier = segue.identifier, segueIdentifier = SegueIdentifier(rawValue: identifier) else {
            fatalError("Invalid segue identifier \(segue.identifier)")
        }
        return segueIdentifier
    }
}
