//
//  ViewController.swift
//  RxSmartBag
//
//  Created by rinov on 05/11/2017.
//  Copyright (c) 2017 rinov. All rights reserved.
//

import UIKit
import RxSwift

// Use `smartBag`
import RxSmartBag

final class ViewController: UIViewController {

    let text = Variable<String>("RxSmartBag")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // `smartBag` is a dispose bag and automatically released when `ViewController` is deinit.
        
        // Example1:
        text
            .asObservable()
            .map { "Text(1) = \($0)" }
            .subscribe(onNext: { message in
                print(message)
            })
            .disposed(by: smartBag)
        
        // Example2:
        text
            .asObservable()
            .map { "Text(2) = \($0)" }
            .subscribe(onNext: { message in
                print(message)
            })
            .disposed(by: self)

        // Example3:
        smartBag += text
            .asObservable()
            .map { "Text(3) = \($0)" }
            .subscribe(onNext: { message in
                print(message)
            })

    }
}
