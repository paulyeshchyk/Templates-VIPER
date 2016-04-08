//
//  NNEmptyDetailModule.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 08/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation
import UIKit

class NNEmptyDetailModule: NSObject, NNEmptyDetailModuleProtocol {

    var rootWindow: UIWindow
    var presenter: NNEmptyDetailPresenterProtocol
    var emptyDetailView: NNEmptyDetailViewProtocol

    var view: UIViewController {

        get {

            return self.emptyDetailView.viewController
        }
    }

    required init(window:UIWindow) {

        rootWindow = window

        emptyDetailView = NNEmptyDetailViewController(nibName: "NNEmptyDetailViewController", bundle: NSBundle.mainBundle())
        let interactor =  NNEmptyDetailInteractor()
        presenter = NNEmptyDetailPresenter(view: emptyDetailView, interactor: interactor)

        super.init()
    }

    func makeRoot()->UIViewController {

        rootWindow.rootViewController = self.view
        rootWindow.makeKeyAndVisible()
        return self.view
    }

    func pushFrom(navigationController:UINavigationController) {

        navigationController.pushViewController(self.view, animated: true)
    }

    func popFrom(navigationController:UINavigationController) {

        navigationController.popViewControllerAnimated(true)
    }

}
