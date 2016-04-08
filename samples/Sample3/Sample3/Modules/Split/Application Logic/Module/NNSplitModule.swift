//
//  NNSplitModule.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 08/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import UIKit

class NNSplitModule: NSObject, NNSplitModuleProtocol, NNSplitViewPresenterOutput {

    var presenter:NNSplitPresenterProtocol
    var splitView:NNSplitViewProtocol
    var interactor:NNSplitInteractorProtocol
    var rootWindow:UIWindow

    var masterViewCallback: NNSplitMasterViewCallback?
    var detailViewCallback: NNSplitDetailViewCallback?
    var emptyViewCallback: NNSplitEmptyViewCallback?

    var view: UIViewController {

        get {

            return presenter.viewController
        }
    }

    required init(window: UIWindow) {

        rootWindow = window

        splitView = NNSplitViewController()
        interactor = NNSplitInteractor()

        presenter = NNSplitPresenter(view: splitView, splitInteractor: interactor)

        super.init()
        presenter.presenterOutput = self
    }


    func pushFrom(navigationController:UINavigationController) {

        navigationController.pushViewController(self.view, animated: true)
    }

    func popFrom(navigationController: UINavigationController) {

        navigationController.popViewControllerAnimated(true)
    }

    func makeRoot() -> UIViewController{

        presenter.rebuildPresenters()
        
        rootWindow.rootViewController = presenter.viewController
        rootWindow.makeKeyAndVisible()
        return self.view
    }

}
