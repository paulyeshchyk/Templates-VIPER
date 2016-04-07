//
//  NNIPadLauncherModule.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 07/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation
import UIKit

class NNIPadLauncher: NSObject, NNIPadLauncherProtocol {

    //MARK: - NSObject

    deinit {

    }

    var rootWindow:UIWindow
    var root:UIViewController?

    //MARK: -  NNIPadLauncherModuleProtocol
    func launch() {

        self.root = self.splitModule.makeRoot()
    }

    var splitModule:NNSplitModuleProtocol
    let listModule:NNListModuleProtocol
    var detailModule:NNDetailModuleProtocol
    let emptyDetailModule:NNEmptyDetailModuleProtocol

    required init(window:UIWindow) {

        splitModule = NNSplitModule(window: window)
        listModule = NNListModule(window: window)
        detailModule = NNDetailModule(window: window)
        emptyDetailModule = NNEmptyDetailModule(window: window)

        rootWindow = window
        super.init()

        splitModule.masterPresenter = listModule.presenter
        splitModule.detailPresenter = detailModule.presenter
        splitModule.emptyDetailPresenter = emptyDetailModule.presenter

        listModule.openOutput = {(listItem) in

            let detailItem = NNDetailModel(nameValue: listItem.text)
            let splitItem = NNSplitModel(aIdent: listItem.ident, aText: listItem.text)

            self.detailModule.detail = detailItem
            self.splitModule.presenter.selectedItem = splitItem
        }

        listModule.addOutput = {() in

        }

        detailModule.saveOutput = {(detailItem) in

            let listItem = NNListModel(aIdent: detailItem.name, aText: detailItem.name)
            self.listModule.refreshPonso(listItem)
        }

        detailModule.cancelOutput = {() in

        }
    }
}
