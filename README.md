Swift extensions
==============

Some add-ons for swift classes

----------

### UIButton+Utilities

**onTouchUpInside**  
Allows to add a closure o a UIButton object.

##### *Example of use*
```swift


let closureButton: UIButton = {
  $0.frame = CGRect(x: 0, y: 0, width: 100, height: 44)
  $0.layer.backgroundColor = UIColor.clear.cgColor
  $0.layer.borderWidth = 1.0
  $0.layer.borderColor = UIColor.black.cgColor
  $0.layer.cornerRadius = 3.0
  $0.setTitle("Button", for: UIControlState())
  $0.onTouchUpInside { [unowned self] sender in
    // Here goes the closure commands that will be executed
  }
  return $0
}(UIButton())
```


### UIColor+Utilities
Allows to use hexadecimal color values for UIColor (value begins with # and has 8 characters: first two caractes for 'r', second two characters for 'g', third two characters for 'b' and fourth two characters for the 'alpha channel').

##### *Example of use*
```swift
self.backgroundColor = UIColor(hexadecimalString: "#AABBCCFF")
```


### UIView+Utilities
#### UIVIew parameters:
* width
* height
* size
* origin
* x
* y
* centerX
* centerY
* left
* right
* top
* bottom

#### Add round corners to UIView:
##### *Example of use*
```swift
view.round(corners: [.topRight, .topLeft], radius: 3.0)
view.round(corners: [.bottomRight, .botomLeft], radius: 3.0)
view.round(corners: .allCorners, radius: 3.0)
```

#### Get UIView's parent controller:
##### *Example of use*
```swift
let viewParentController = view.parentViewController
```



### String+Utilities

* Generates an alphanumeric string with the desired length.
```swift
func randomAlphaNumericString(_ length: Int) -> String
```

* Returns sha1 value for a string
```swift
func sha1() -> String
```

```swift
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonKeyDerivation.h>
```
These imports must be added to the Bridging-eader file

* Conversion from/to base64 values
```swift
func fromBase64() -> String?  
func toBase64() -> String
```  

* Returns character at index as Character
```swift
subscript (index: Int) -> Character
```

* Returns character at index as String
```swift
subscript (index: Int) -> String
```  

* Returns string in range
```swift
subscript (r: CountableClosedRange<Int>) -> String
```  
