//
//  NNListManager.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 08/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation
import UIKit

class NNListDataManager: NSObject, NNListDatasourceProtocol {

    var listener: NNListDataSourceListenerProtocol?
    var items:[NNListModel] = [
        NNListModel(aIdent:"ABC",aText: "ABC"),
        NNListModel(aIdent:"BCD",aText: "BCD"),
        NNListModel(aIdent:"CDE",aText: "CDE"),
        NNListModel(aIdent:"DEF",aText: "DEF")]


    func numberOfItems() -> Int {

        return items.count
    }

    func itemAtIndex(index:Int) -> AnyObject{

        return items[index]
    }

    func updatePonso(ponso:NNListModel) {


        let arr = items.filter({ (found) -> Bool in

            let compareResult = found.ident.compare(ponso.ident)
            return ( compareResult == .OrderedSame)
        })

        for obj in arr {

            obj.text = ponso.text
        }

        listener?.hasUpdatedData()

    }

    func indexOfItem(item: AnyObject) -> Int {

        var result:Int = -1

        let index =  items.indexOf({ (found:NNListModel) -> Bool in

            let compareResult = found.ident.compare(item.ident)

            return (compareResult == .OrderedSame)
        })

        result = index!

        return result
    }

    func addPonso(ponso:NNListModel) {

        self.items.append(ponso)
    }

}
