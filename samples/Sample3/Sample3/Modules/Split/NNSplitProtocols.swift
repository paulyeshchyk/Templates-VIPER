//
//  NNSplitProtocols.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 08/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation
import UIKit

typealias NNSplitAddDetailOutput = () -> ()
typealias NNSplitMasterViewCallback = () -> UIViewController
typealias NNSplitDetailViewCallback = () -> UIViewController
typealias NNSplitEmptyViewCallback = () -> UIViewController

protocol NNSplitViewPresenterOutput {
    
    var masterViewCallback: NNSplitMasterViewCallback? { get set }
    var detailViewCallback: NNSplitDetailViewCallback? { get set }
    var emptyViewCallback: NNSplitEmptyViewCallback? { get set }
}

protocol NNSplitModuleProtocol {

    var interactor:NNSplitInteractorProtocol {get set}
    var presenter:NNSplitPresenterProtocol {get set}
    var splitView:NNSplitViewProtocol {get set}

    func makeRoot() -> UIViewController
    func pushFrom(navigationController: UINavigationController)
    func popFrom(navigationController: UINavigationController)

    var view: UIViewController { get }
    var rootWindow: UIWindow { get }

}

protocol NNSplitViewProtocol {

    var viewController: UIViewController { get }
    func setSplittedControllers(viewControllers:[UIViewController])
}

protocol NNSplitInteractorProtocol {

    var selectedItem: NNSplitModel? { get set }
}

protocol NNSplitPresenterProtocol {

    var presenterOutput: NNSplitViewPresenterOutput? { get set }
    var viewController: UIViewController { get }
    var interactor: NNSplitInteractorProtocol? {get set}

    var selectedItem: NNSplitModel? { get set }

    func rebuildPresenters()
    init(view:NNSplitViewProtocol, splitInteractor:NNSplitInteractorProtocol)
}
