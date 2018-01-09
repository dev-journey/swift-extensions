//
//  UIColor+Utilities.swift
//  Dev-Journey
//
//  Created by RaulF on 1/8/16.
//  Copyright © 2016 RaulF. All rights reserved.
//

import UIKit

extension UIColor {
	/**
	Returns UIColor from a hexadecimal value

	- parameter hexadecimalString: String with hexadecimal color (e.g.: #AAAAAAFF). Last two characters corresponds to alpha value.
	*/
	public convenience init?(hexadecimalString: String) {

		let r, g, b, a: CGFloat		
		
		guard hexadecimalString.hasPrefix("#") && hexadecimalString.count == 9 else {
			self.init(red: 170.0 / 255.0, green: 170.0 / 255.0, blue: 170.0 / 255.0, alpha: 1)
			return
		}

		let start = hexadecimalString.index(hexadecimalString.startIndex, offsetBy: 1)
		let hexadecimalColor = hexadecimalString.substring(from: start)
		let scanner = Scanner(string: hexadecimalColor)
		var hexNumber: UInt64 = 0
    
    guard scanner.scanHexInt64(&hexNumber) else {
      return nil
    }
    
    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
    a = CGFloat(hexNumber & 0x000000ff) / 255
    
    self.init(red: r, green: g, blue: b, alpha: a)
    
    return
  }
}
