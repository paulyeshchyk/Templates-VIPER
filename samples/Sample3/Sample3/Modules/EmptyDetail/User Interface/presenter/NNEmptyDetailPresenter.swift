//
//  NNEmptyDetailPresenter.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 07/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation
import UIKit

class NNEmptyDetailPresenter: NSObject, NNEmptyDetailPresenterProtocol {

    var viewController:UIViewController {

        get {

            let result = UINavigationController(rootViewController: emptyDetailView.viewController)
            return result
        }
    }

    var emptyDetailView: NNEmptyDetailViewProtocol
    var emptyDetailInteractor: NNEmptyDetailInteractorProtocol

    required init(view: NNEmptyDetailViewProtocol, interactor: NNEmptyDetailInteractorProtocol) {

        emptyDetailView = view
        emptyDetailInteractor = interactor
    }
}
