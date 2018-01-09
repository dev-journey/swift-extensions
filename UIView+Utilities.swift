//
//  UIView+Utilities.swift
//
//  Created by rfg-dev on 8/12/16.
//  Copyright © 2016 rfg-dev. All rights reserved.
//

import UIKit

// MARK: - UIVIew parameters

extension UIView {
  
  ///  Width
  var width: CGFloat {
    return self.frame.size.width
  }
  
  /// Height
  var height: CGFloat {
    return self.frame.size.height
  }
  
  /// Size
  var size: CGSize {
    return self.frame.size
  }
  
  /// Origin
  var origin: CGPoint {
    return self.frame.origin
  }
  
  /// X origin
  var x: CGFloat {
    return self.frame.origin.x
  }
  
  /// Y origin
  var y: CGFloat {
    return self.frame.origin.y
  }
  
  /// X center
  var centerX: CGFloat {
    return self.center.x
  }
  
  /// Y center
  var centerY: CGFloat {
    return self.center.y
  }
  
  /// Left position
  var left: CGFloat {
    return self.frame.origin.x
  }
  
  /// Right position
  var right: CGFloat {
    return self.frame.origin.x + self.frame.size.width
  }
  
  /// Top position
  var top: CGFloat {
    return self.frame.origin.y
  }
  
  /// Bottom position
  var bottom: CGFloat {
    return self.frame.origin.y + self.frame.size.height
  }
}


// MARK: - Add round corners to UIView

extension UIView {
  /**
   Take UIView and round one or more corners
   
   - Parameters:
   - corners: Corners to round
   - radius: Corner radius
   */
  func round(corners: UIRectCorner, radius: CGFloat) {
    let path = UIBezierPath(roundedRect:self.bounds,
                            byRoundingCorners:corners,
                            cornerRadii: CGSize(width: radius, height: radius))
    let maskLayer = CAShapeLayer()
    maskLayer.path = path.cgPath
    self.layer.mask = maskLayer
  }
}


// MARK: - Get view's parent viewController

extension UIView {
  /**
   UIView Parent viewController
   */
  var parentViewController: UIViewController? {
    var parentResponder: UIResponder? = self
    
    while parentResponder != nil {
      parentResponder = parentResponder!.next
      if let viewController = parentResponder as? UIViewController {
        return viewController
      }
    }
    
    return nil
  }
}
