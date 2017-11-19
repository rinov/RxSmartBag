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
public protocol SmartBagManagerable {
    var smartBag: DisposeBag { get set }
}

// Implements smartBag by objective-c runtime functions.
extension SmartBagManagerable {
    public var smartBag: DisposeBag {
        get {
            var disposeBag: DisposeBag!
            synchronized {
                if let lookup = objc_getAssociatedObject(self, &DisposeBag.AllocatedObject.instance) as? DisposeBag {
                    disposeBag = lookup
                } else {
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
    
    private func synchronized(_ closure: () -> ()) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        closure()
    }
    
    @discardableResult
    private func associateObject(newValue: DisposeBag) -> DisposeBag {
        synchronized {
            objc_setAssociatedObject(self, &DisposeBag.AllocatedObject.instance, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        return newValue
    }
}

// For more simply syntax, like `smartBag += A.subscribe(...)`.
public func += (lhs: DisposeBag, rhs: Disposable) {
    rhs.disposed(by: lhs)
}

extension Disposable {
    public func disposed(by bag: SmartBagManagerable) {
        bag.smartBag.insert(self)
    }
}
