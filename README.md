# RxSmartBag

[![Language](https://img.shields.io/badge/Language-Swift-blue.svg)](https://img.shields.io/badge/Language-Swift-blue.svg)
[![License](https://img.shields.io/badge/LICENSE-MIT-orange.svg)](https://img.shields.io/badge/LICENSE-MIT-orange.svg)
[![Platform](https://img.shields.io/badge/Platform-iOS-lightgrey.svg)](https://img.shields.io/badge/Platform-iOS-lightgrey.svg)

## About

A simple way to omit declararing `DisposeBag` in anywhere if the object inherit from `NSObject`.

## Example

```swift
class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    // `smartBag` is able to use without declararing, and can bind simply by operator.
    smartBag += observable.subscribe(...)
    // or
    observable.subscribe(...).disposed(by: smartBag)
}
```
## Installation

RxSmartBag is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RxSmartBag"
```

## Author

rinov, rinov@rinov.jp

## License

RxSmartBag is available under the MIT license. See the LICENSE file for more info.
