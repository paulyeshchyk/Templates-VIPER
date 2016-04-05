//
//  NNListInteractor.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 05/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation

class NNListInteractor: NSObject, NNListInteractorProtocol, NNListDataSourceListenerProtocol {

    var output:NNListPresenterProtocol?
    var datasource:NNListDatasourceProtocol
    var selectedItem:String?

    deinit {

        self.datasource.listener = nil
    }

    required init(datasource: NNListDatasourceProtocol) {

        self.datasource = datasource
        super.init()
        self.datasource.listener = self
    }


    func refetchData() {

        //TODO: make service call

        output?.redrawData()
    }

    func listItemsCount()->Int {

        return self.datasource.numberOfItems()
    }

    func listItemAtIndex(index:Int)->NNListModel {

        return self.datasource.itemAtIndex(index)
    }

    func hasUpdatedData() {

        self.refetchData()
    }

}