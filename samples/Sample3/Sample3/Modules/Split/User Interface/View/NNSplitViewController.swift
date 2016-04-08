//
//  NNSplitViewController.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 08/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import UIKit

class NNSplitViewController: UISplitViewController, NNSplitViewProtocol, UITextFieldDelegate  {

    var viewController:UIViewController {

        get {

            return self
        }
    }

    func setSplittedControllers(viewControllers:[UIViewController]) {

        let count = viewControllers.count
        if count != 2 {

            return
        }
        self.viewControllers = viewControllers
    }

    override func viewDidLoad() {

        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
