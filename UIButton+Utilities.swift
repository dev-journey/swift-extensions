//
//  UIButton+Utilities.swift
//
//  Created by rfg-dev on 8/12/16.
//  Copyright © 2016 rfg-dev. All rights reserved.
//

import UIKit
import ObjectiveC

var ActionTouchUpInsideKey: UInt8 = 0
var ActionTouchDownKey: UInt8 = 0
var ActionTouchDragExitKey: UInt8 = 0
var ActionTouchDragEnterKey: UInt8 = 0

typealias BlockButtonActionBlock = (_ sender: UIButton) -> Void

class ActionBlockWrapper : NSObject {
  var block : BlockButtonActionBlock
  init(block: @escaping BlockButtonActionBlock) {
    self.block = block
  }
}

/// If referencing self, use [unowned self] above to prevent a retain cycle
extension UIButton {
  /// Touch up inside behaviour
  func onTouchUpInside(_ block: @escaping BlockButtonActionBlock) {
    objc_setAssociatedObject(self, &ActionTouchUpInsideKey, ActionBlockWrapper(block: block), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    addTarget(self, action: #selector(UIButton.blockTouchUpInside(_:)), for: .touchUpInside)
  }
  
  func blockTouchUpInside(_ sender: UIButton) {
    let wrapper = objc_getAssociatedObject(self, &ActionTouchUpInsideKey) as! ActionBlockWrapper
    wrapper.block(sender)
  }
  
  /// Touch down inside behaviour
  func onTouchDown(_ block: @escaping BlockButtonActionBlock) {
    objc_setAssociatedObject(self, &ActionTouchDownKey, ActionBlockWrapper(block: block), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    addTarget(self, action: #selector(UIButton.blockTouchDown(_:)), for: .touchDown)
  }
  
  func blockTouchDown(_ sender: UIButton) {
    let wrapper = objc_getAssociatedObject(self, &ActionTouchDownKey) as! ActionBlockWrapper
    wrapper.block(sender)
  }
  
  /// Tocuh drag exit behaviour
  func onTouchDragExit(_ block: @escaping BlockButtonActionBlock) {
    objc_setAssociatedObject(self, &ActionTouchDragExitKey, ActionBlockWrapper(block: block), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    addTarget(self, action: #selector(UIButton.blockTouchDragExit(_:)), for: .touchDragExit)
  }
  
  func blockTouchDragExit(_ sender: UIButton) {
    let wrapper = objc_getAssociatedObject(self, &ActionTouchDragExitKey) as! ActionBlockWrapper
    wrapper.block(sender)
  }
  
  /// Touch drag enter behaviour
  func onTouchDragEnter(_ block: @escaping BlockButtonActionBlock) {
    objc_setAssociatedObject(self, &ActionTouchDragEnterKey, ActionBlockWrapper(block: block), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    addTarget(self, action: #selector(UIButton.blockTouchDragEnter(_:)), for: .touchDragEnter)
  }
  
  func blockTouchDragEnter(_ sender: UIButton) {
    let wrapper = objc_getAssociatedObject(self, &ActionTouchDragEnterKey) as! ActionBlockWrapper
    wrapper.block(sender)
  }
}
