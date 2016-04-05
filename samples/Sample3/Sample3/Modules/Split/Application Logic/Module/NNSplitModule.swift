//
//  NNSplitModule.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 05/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import UIKit

class NNSplitModule: NNSplitModuleProtocol {

    var presenter:NNSplitPresenterProtocol
    var splitView:NNSplitViewProtocol
    var interactor:NNSplitInteractorProtocol
    var rootWindow:UIWindow


    var view: UIViewController {

        get {

            return self.splitView.viewController
        }
    }

    var emptyDetailPresenter: PresenterProtocol? {

        didSet {

            self.presenter.emptyDetailPresenter = emptyDetailPresenter
        }
    }

    var masterPresenter: PresenterProtocol? {

        didSet {

            self.presenter.masterPresenter = masterPresenter
        }
    }

    var detailPresenter: NNDetailPresenterProtocol? {

        didSet {

            self.presenter.detailPresenter = detailPresenter
        }
    }

    required init(window: UIWindow) {

        rootWindow = window

        splitView = NNSplitViewController()
        interactor = NNSplitInteractor()

        presenter = NNSplitPresenter(view: splitView, splitInteractor: interactor)
    }

    func pushFrom(navigationController:UINavigationController) {

        navigationController.pushViewController(self.view, animated: true)
    }

    func popFrom(navigationController: UINavigationController) {

        navigationController.popViewControllerAnimated(true)
    }

    func makeRoot() -> UIViewController{

        rootWindow.rootViewController = self.view
        rootWindow.makeKeyAndVisible()
        return self.view
    }

}
