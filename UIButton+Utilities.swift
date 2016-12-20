//
//  UIButton+Utilities.swift
//
//  Created by rfg-dev on 8/12/16.
//  Copyright © 2016 rfg-dev. All rights reserved.
//

import UIKit
import ObjectiveC

var ClosureActionKey: UInt8 = 0

typealias ButtonClosureAction = (_ sender: UIButton) -> Void

class ClosureActionWrapper : NSObject {
	var closure : ButtonClosureAction
	init(closure: @escaping ButtonClosureAction) {
		self.closure = closure
	}
}

/// This UIButton extension adds closure to UIButton target
/// If referencing self, use [unowned self] above to prevent a retain cycle
extension UIButton {
	func onTouchUpInside(_ closure: @escaping ButtonClosureAction) {
		objc_setAssociatedObject(self, &ClosureActionKey, ClosureActionWrapper(closure: closure), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
		addTarget(self, action: #selector(UIButton.handleAction(_:)), for: .touchUpInside)
	}
	
	func handleAction(_ sender: UIButton) {
		let wrapper = objc_getAssociatedObject(self, &ClosureActionKey) as! ClosureActionWrapper
		wrapper.closure(sender)
	}
}
