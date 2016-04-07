//
//  NNIPhoneLauncherModule.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 07/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation
import UIKit

class NNIPhoneLauncher: NSObject, NNIPhoneLauncherProtocol {

    var rootWindow:UIWindow
    let listModule:NNListModuleProtocol
    var detailModule:NNDetailModuleProtocol
    var root:UIViewController?

    required init(window:UIWindow) {

        listModule = NNListModule(window: window)
        detailModule = NNDetailModule(window: window)
        rootWindow = window
        super.init()

        listModule.openOutput = {(listItem) in

            //TODO: tempo

            guard let nc = self.root as? UINavigationController else {

                return
            }
            let detail = NNDetailModel(nameValue: listItem.text)
            self.detailModule.detail = detail
            self.detailModule.pushFrom(nc)
        }

        listModule.addOutput = {() in

            guard let nc = self.root as? UINavigationController else {

                return
            }

            self.detailModule.pushFrom(nc)
        }

        detailModule.saveOutput = {(detailItem) in

            let listItem = NNListModel(aIdent: detailItem.name, aText: detailItem.name)
            self.listModule.updatePonso(listItem)

            guard let nc = self.root as? UINavigationController else {

                return
            }
            self.detailModule.popFrom(nc)
        }

        detailModule.cancelOutput = {() in

            guard let nc = self.root as? UINavigationController else {

                return
            }
            self.detailModule.popFrom(nc)
        }
    }

    func launch() {

        root = self.listModule.makeRoot()
    }

}
