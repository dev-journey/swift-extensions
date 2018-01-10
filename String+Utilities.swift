//
//  String+Utilities.swift
//  dev-journey
//
//  Created by RaulF on 2/9/16.
//  Copyright © 2016 rfg-dev. All rights reserved.
//

import Foundation

extension String {
  /// Generate alphanumeric string as identifier
  ///
  /// - Parameter length: String desired length
  /// - Returns: Alphanumeric string
	func randomAlphaNumericString(_ length: Int) -> String {

		let allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
		let allowedCharsCount = UInt32(allowedChars.count)
		var randomString = ""

		for _ in (0..<length) {
			let randomNum = Int(arc4random_uniform(allowedCharsCount))
			let newCharacter = allowedChars[allowedChars.index(allowedChars.startIndex, offsetBy: randomNum)]
			randomString += String(newCharacter)
		}

		return randomString
	}

  
  /// Returns sha1 for a string
  ///
  /// - Returns: String sha1
	func sha1() -> String {
		let data = self.data(using: String.Encoding.utf8)!
		var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
		CC_SHA1((data as NSData).bytes, CC_LONG(data.count), &digest)
		let hexBytes = digest.map { String(format: "%02hhx", $0) }
		return hexBytes.joined(separator: "")
	}
  

  /// Base64 conversion
  ///
  /// - Returns: String from base64 data
  func fromBase64() -> String? {
    guard let data = Data(base64Encoded: self) else {
      return nil
    }
    
    return String(data: data, encoding: .utf8)
  }
  
  
  /// Encode to base64
  ///
  /// - Returns: Base64 string
  func toBase64() -> String {
    return Data(self.utf8).base64EncodedString()
  }
  
  
  /// Returns character at index as character
  ///
  /// - Parameter index: Character index
	subscript (index: Int) -> Character {
		return self[self.index(self.startIndex, offsetBy: index)]
	}

  
  /// Returns character at index as string
  ///
  /// - Parameter index: Character index
	subscript (index: Int) -> String {
		return String(self[index] as Character)
	}

  
  /// Returns string at range
  ///
  /// - Parameter r: Range
  subscript (r: CountableClosedRange<Int>) -> String {
    let start = index(startIndex, offsetBy: r.lowerBound)
    let end = index(start, offsetBy: r.upperBound - r.lowerBound)
    return self[(start ... end)]
  }
}
