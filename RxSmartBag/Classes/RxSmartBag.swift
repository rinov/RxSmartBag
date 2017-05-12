//
//  RxSmartBag.swift
//  Pods
//
//  Created by Ryo Ishikawa on 2017/05/11.
//
//

import Foundation
import RxSwift

// `AllocatedObject` is used for associated object.
extension DisposeBag {
    struct AllocatedObject {
        static var instance = DisposeBag()
    }
}

//`SmartBagManagerable` represents that having a stored property of dispose bag by automatically.
public protocol SmartBagManagerable {}

// Implements smartBag by objective-c runtime functions.
public extension SmartBagManagerable {
    var smartBag: DisposeBag {
        get {
            var disposeBag: DisposeBag!
            synclonized {
                if let lookup = objc_getAssociatedObject(self, &DisposeBag.AllocatedObject.instance) as? DisposeBag {
                    disposeBag = lookup
                }else{
                    // If a new dispose bag were setted,`smartBag` will release current disposable reference immediately.
                    disposeBag = associateObject(newValue: DisposeBag())
                }
            }
            return disposeBag
        }
        set {
            associateObject(newValue: newValue)
        }
    }
}

private extension SmartBagManagerable {
    
    func synclonized(_ closure: () -> ()) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        closure()
    }
    
    @discardableResult
    func associateObject(newValue: DisposeBag) -> DisposeBag {
        synclonized {
            objc_setAssociatedObject(self, &DisposeBag.AllocatedObject.instance, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        return newValue
    }
    
}

// For more simply syntax, like `smartBag += A.subscribe(...)`.
public func += (lhs: DisposeBag, rhs: Disposable) {
    rhs.disposed(by: lhs)
}
