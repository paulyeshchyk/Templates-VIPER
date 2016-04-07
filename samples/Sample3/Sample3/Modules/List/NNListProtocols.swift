//
//  NNListProtocols.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 07/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation
import UIKit

typealias NNListModuleAddDetailOutput = ()->()
typealias NNListModuleOpenDetailOutput = (listItem:NNListModel)->()
protocol NNListModuleProtocol:ModuleProtocol {

    var presenter:NNListPresenterProtocol { get set }
    var listView:NNListViewProtocol { get set }
    var addOutput:NNListModuleAddDetailOutput? { get set }
    var openOutput:NNListModuleOpenDetailOutput? { get set }
    func updatePonso(ponso:NNListModel)
    func refreshPonso(ponso:NNListModel)
}

protocol NNListViewProtocol:ViewProtocol {

    var input:NNListInteractorProtocol? { get set }
    var output:NNListPresenterProtocol? { get set }
    func reloadTableview()
    func reloadItemAtIndex(index:Int)
}

protocol NNListDataSourceListenerProtocol {

    func hasUpdatedData()
}

protocol NNListDatasourceProtocol {

    var listener:NNListDataSourceListenerProtocol? { get set }
    func numberOfItems()->Int
    func itemAtIndex(index:Int)->NNListModel
    func indexOfItem(item:NNListModel)->Int
    func updatePonso(ponso:NNListModel)
    func addPonso(ponso:NNListModel)
}

protocol NNListInteractorProtocol {

    init(datasource:NNListDatasourceProtocol)

    func refetchData()

    var selectedItem:String? { get set }
    var output:NNListPresenterProtocol? { get set }
    func listItemsCount()->Int
    func listItemAtIndex(index:Int)->NNListModel
}

protocol NNListPresenterProtocol:PresenterProtocol {

    var output:NNListPresenterOutputProtocol? { get set }

    init(view:NNListViewProtocol, interactor:NNListInteractorProtocol)

    func openDetailAtIndex(index:Int)
    func redrawData()
    func fetchData()
    func addItem()
    func redrawItemAtIndex(index:Int)
}

protocol NNListPresenterOutputProtocol {

    func openAddDetail()
    func openItem(item:NNListModel)

}

