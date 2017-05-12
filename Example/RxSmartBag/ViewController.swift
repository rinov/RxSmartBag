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

class ViewController: UIViewController {

    let observable = Observable.of(1,2,3,4,5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // `smartBag` is a dispose bag and automatically released when parent is deinit.
        smartBag += observable.subscribe(onNext: { value in
            print(value)
        })
        
    }

}
