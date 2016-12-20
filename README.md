swift-extensions
==============

Some add-ons for swift classes

----------

### UIButton+Utilities

**onTouchUpInside**
Allows to add a closure o a UIButton object.

##### *Example of use*
```
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
