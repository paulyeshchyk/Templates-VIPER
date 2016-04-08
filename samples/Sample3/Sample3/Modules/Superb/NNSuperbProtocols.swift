//
//  NNSuperbProtocols.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 08/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation
import UIKit

typealias NNSuperbModuleSaveOutput = (detail:NNSuperbModel)->()
typealias NNSuperbModuleCancelAddDetailOutput = ()->()

protocol NNSuperbInteractorOutputProtocol {

    func presentDetail(detail:NNSuperbModel)
}

protocol NNSuperbInteractorProtocol {

    var output: NNSuperbInteractorOutputProtocol? { get set }
    func fetchData(predicate: NSPredicate)
    func changeName(name:String, forDetail:NNSuperbModel?)
}

typealias NNSuperbManagerResultCompletionBlock = (result:NNSuperbModel?, error:NSError?)->()

protocol NNSuperbManagerProtocol {

    func findItem(usingPredicate:NSPredicate, completion:NNSuperbManagerResultCompletionBlock)
}

protocol NNSuperbModuleProtocol {

    var saveOutput: NNSuperbModuleSaveOutput? { get set}
    var cancelOutput: NNSuperbModuleCancelAddDetailOutput? {get set}
    var detail: NNSuperbModel? { get set }
    var presenter:NNSuperbPresenterProtocol { get set}

    func makeRoot()->UIViewController
    func pushFrom(navigationController:UINavigationController)
    func popFrom(navigationController:UINavigationController)

    var view: UIViewController { get }
    var rootWindow: UIWindow { get }

}

protocol NNSuperbViewProtocol {

    var viewController: UIViewController { get }
    var output:NNSuperbPresenterProtocol? { get set }

    var nameValue:String? { get set }
    var sampleError:String? { get set }

}

protocol NNSuperbPresenterOutputProtocol {

}

protocol NNSuperbPresenterProtocol {

    var viewController: UIViewController { get }
    var output:NNSuperbPresenterOutputProtocol? { get set }
    var detail: NNSuperbModel? { get set }
    func viewHasBeenLoaded()

    init(view:NNSuperbViewProtocol, interactor:NNSuperbInteractorProtocol)
    func presentError(error:NSError)

    func nameChanged(value:String)
    func saveItem(sender:AnyObject?)

}



