//
//  NNIPadLauncherModule.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 05/04/2016.
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
    //let emptyDetailModule:NNEmptyDetailModuleProtocol

    required init(window:UIWindow) {

        splitModule = NNSplitModule(window: window)
        listModule = NNListModule(window: window)
        detailModule = NNDetailModule(window: window)
        //emptyDetailModule = NNEmptyDetailModule(window: window)

        rootWindow = window
        super.init()

        splitModule.masterPresenter = listModule.presenter
        splitModule.detailPresenter = detailModule.presenter
        //splitModule.emptyDetailPresenter = emptyDetailModule.presenter

        //listModule.openOutput = {(item) in
        //
        //
        //self.detailModule.detail = item
        //self.splitModule.presenter.selectedItem = item
        //}

        //listModule.addOutput = {() in
        //
        //}

        //detailModule.saveOutput = {(ponso) in

        //  self.listModule.refreshPonso(ponso)
        //}

        //detailModule.cancelOutput = {() in
        //
        //}
    }
}
