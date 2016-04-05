//
//  NNIPadModule.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 04/04/2016.
//  Copyright 2016 NN. All rights reserved.
//

import Foundation
import UIKit

class NNIPadModule: NSObject, NNIPadLauncherProtocol {

    //MARK: - NSObject

    deinit {

    }

    var rootWindow:UIWindow
    required init(window: UIWindow) {

        rootWindow = window

        super.init()
    }

    //MARK: - NNIPadLauncherProtocol
    func launch() {

    }


}
