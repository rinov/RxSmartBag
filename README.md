# RxSmartBag

[![Language](https://img.shields.io/badge/Language-Swift-blue.svg)](https://img.shields.io/badge/Language-Swift-blue.svg)
[![License](https://img.shields.io/badge/LICENSE-MIT-orange.svg)](https://img.shields.io/badge/LICENSE-MIT-orange.svg)
[![Platform](https://img.shields.io/badge/Platform-iOS-lightgrey.svg)](https://img.shields.io/badge/Platform-iOS-lightgrey.svg)

## About

A simple way to omit declararing `DisposeBag`.

## Example

```swift
import UIKit
import RxSmartBag

extension UIViewController: SmartBagManagerable {}
```

```swift
import RxSmartBag

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    // `smartBag` is able to use without declararing, and can bind simply by operator.
    
    // Example 1:
    observable.subscribe(...).disposed(by: smartBag)
    
    // Example 2:
    observable.subscribe(...).disposed(by: self)
    
    // Example 3:
    smartBag += observable.subscribe(...)

}
```

## Installation

RxSmartBag is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RxSmartBag"
```

Swift3: `pod "RxSmartBag", "~> 1.0.2"`

Swift4: `pod "RxSmartBag", "~> 2.0.0"`

## Author

rinov, rinov@rinov.jp

## License

RxSmartBag is available under the MIT license. See the LICENSE file for more info.
