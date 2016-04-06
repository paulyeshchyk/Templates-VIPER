//
//  NNListPresenter.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 06/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation
import UIKit

class NNListPresenter: NSObject, NNListPresenterProtocol {

    var listView:NNListViewProtocol
    var listInteractor:NNListInteractorProtocol
    var output:NNListPresenterOutputProtocol?

    var viewController: UIViewController {

        get {

            let result = UINavigationController(rootViewController: listView.viewController)
            return result
        }
    }

    required init(view: NNListViewProtocol, interactor: NNListInteractorProtocol) {

        listView = view
        listInteractor = interactor
    }

    func fetchData() {

        self.listInteractor.refetchData()
    }

    func addItem() {

        guard let output = self.output else {

            return
        }

        output.openAddDetail()
    }

    func redrawData() {

        self.listView.reloadTableview()
    }

    func openDetailAtIndex(index: Int) {

        let item = self.listInteractor.listItemAtIndex(index)

        self.output?.openItem(item)
    }

    func redrawItemAtIndex(index:Int) {

        listView.reloadItemAtIndex(index)
    }
}