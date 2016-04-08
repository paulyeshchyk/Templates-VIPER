//
//  NNEmptyDetailprotocols.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 08/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation
import UIKit

protocol NNEmptyDetailModuleProtocol {

    var presenter:NNEmptyDetailPresenterProtocol {get set}

    func makeRoot() -> UIViewController
    func pushFrom(navigationController: UINavigationController)
    func popFrom(navigationController: UINavigationController)

    var view: UIViewController { get }
    var rootWindow: UIWindow { get }

}

protocol NNEmptyDetailPresenterProtocol {

    var viewController: UIViewController { get }
    init(view:NNEmptyDetailViewProtocol, interactor:NNEmptyDetailInteractorProtocol)
}

protocol NNEmptyDetailViewProtocol {

    var viewController: UIViewController { get }
}

protocol NNEmptyDetailInteractorProtocol {

}