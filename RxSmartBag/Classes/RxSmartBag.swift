//
//  RxSmartBag.swift
//  Pods
//
//  Created by Ryo Ishikawa on 2017/05/11.
//
//

import Foundation
import RxSwift

public extension NSObject {

    struct SmartBag {
        static var instance = DisposeBag()
    }

    var smartBag: DisposeBag {
        get {
            var disposeBag: DisposeBag!
            synclonized {
                if let lookup = objc_getAssociatedObject(self, &SmartBag.instance) as? DisposeBag {
                    disposeBag = lookup
                }else{
                    self.smartBag = DisposeBag()
                    disposeBag = self.smartBag
                }
            }
            return disposeBag
        }
        set {
            synclonized {
                objc_setAssociatedObject(self, &SmartBag.instance, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
}

private extension NSObject {
    func synclonized(_ closure: () -> ()) {
        DispatchQueue.global().sync {
            closure()
        }
    }
}

public extension Reactive where Base: NSObject {
    var smartBag: DisposeBag {
        return base.smartBag
    }
}

public func += (lhs: DisposeBag, rhs: Disposable) {
    rhs.disposed(by: lhs)
}
