//
//  NNVIPERProtocols.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 08/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import UIKit

protocol ModuleProtocol {

    func makeRoot()->UIViewController
    func pushFrom(navigationController:UINavigationController)
    func popFrom(navigationController:UINavigationController)

    var view: UIViewController { get }
    var rootWindow: UIWindow { get }

}

protocol ViewProtocol {

    var viewController: UIViewController { get }
    var output: ViewOutputProtocol { get }
}

protocol ViewOutputProtocol {

    func viewHasBeenLoaded()
}

protocol InteractorProtocol {

}

protocol PresenterProtocol {

    var viewController: UIViewController { get }
}

protocol LauncherProtocol {

}


protocol ListDatasourceProtocol {

    func numberOfItems() -> Int
    func itemAtIndex(index: Int) -> AnyObject
    func indexOfItem(item: AnyObject) -> Int
}

protocol ItemDatasourceProtocol {

    func addItem() -> AnyObject
    func deleteItem(item: AnyObject)
    func saveItem(item: AnyObject)

}