//
//  NNSplitProtocols.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 06/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation
import UIKit

typealias NNSplitAddDetailOutput = ()->()
protocol NNSplitModuleProtocol:ModuleProtocol {

    var interactor:NNSplitInteractorProtocol {get set}
    var presenter:NNSplitPresenterProtocol {get set}
    var splitView:NNSplitViewProtocol {get set}

    var masterPresenter:PresenterProtocol? {get set}
    var detailPresenter:PresenterProtocol? {get set}
    var emptyDetailPresenter:PresenterProtocol? {get set}
    
    func setSelectedItem(item:NNSplitModel)
    
}

protocol NNSplitViewProtocol:ViewProtocol {

//    var output:NNSplitPresenterProtocol? {get set}
    func setSplittedControllers(viewControllers:[UIViewController])
}

protocol NNSplitInteractorProtocol:InteractorProtocol {

    var selectedItem:NNSplitModel? { get set }
}

protocol NNSplitPresenterProtocol:PresenterProtocol {

    var interactor:NNSplitInteractorProtocol? {get set}
    var masterPresenter:PresenterProtocol? {get set}
    var detailPresenter:PresenterProtocol? {get set}
    var emptyDetailPresenter:PresenterProtocol? {get set}

    var selectedItem:NNSplitModel? { get set }


    init(view:NNSplitViewProtocol, splitInteractor:NNSplitInteractorProtocol)
}

protocol NNSplitPresenterOutputProtocol {

//    var hasSelectedItem:Bool { get }

}
