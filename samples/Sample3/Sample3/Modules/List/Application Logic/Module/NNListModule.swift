//
//  NNListModule.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 07/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation
import UIKit

class NNListModule: NSObject, NNListModuleProtocol, NNListPresenterOutputProtocol {

    var presenter: NNListPresenterProtocol
    var listView: NNListViewProtocol
    let datamanager: NNListDatasourceProtocol
    var listInteractor: NNListInteractorProtocol
    var addOutput: NNListModuleAddDetailOutput?
    var openOutput: NNListModuleOpenDetailOutput?

    var routerWindow:UIWindow
    var view: UIViewController {

        get {

            return self.listView.viewController
        }
    }

    required init(window: UIWindow) {

        routerWindow = window

        datamanager = NNListDataManager()
        listInteractor = NNListInteractor(datasource:datamanager)

        listView = NNListViewController(nibName:"NNListViewController", bundle: NSBundle.mainBundle())
        presenter = NNListPresenter(view: listView, interactor:listInteractor)

        listInteractor.output = presenter

        listView.output = presenter
        listView.input = listInteractor

        super.init()
        presenter.output = self
    }

    func pushFrom(navigationController:UINavigationController) {

        navigationController.pushViewController(self.view, animated: true)
    }

    func popFrom(navigationController: UINavigationController) {

        navigationController.popViewControllerAnimated(true)
    }

    func makeRoot() -> UIViewController{

        let nc = UINavigationController(rootViewController: self.view)
        routerWindow.rootViewController = nc
        routerWindow.makeKeyAndVisible()
        return nc
    }

    func updatePonso(ponso: NNListModel) {

        datamanager.updatePonso(ponso)
    }

    func refreshPonso(ponso: NNListModel) {

        let index = datamanager.indexOfItem(ponso)
        self.presenter.redrawItemAtIndex(index)
    }

    func openItem(item: NNListModel) {

        guard let openOutput = self.openOutput else {

            return
        }

        openOutput(listItem: item)
    }

    func openAddDetail() {

        guard let addOutput = self.addOutput else {

            return
        }

        addOutput()

    }

}
