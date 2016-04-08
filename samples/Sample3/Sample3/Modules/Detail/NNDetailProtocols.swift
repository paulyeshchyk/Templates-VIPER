//
//  NNDetailProtocols.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 08/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation
import UIKit

typealias NNDetailModuleSaveOutput = (detail:NNDetailModel)->()
typealias NNDetailModuleCancelAddDetailOutput = ()->()

protocol NNDetailInteractorProtocol {

    var output:NNDetailInteractorOutputProtocol? { get set }
    func fetchData(predicate: NSPredicate)
    func changeName(name:String, forDetail:NNDetailModel?)
}

typealias NNDetailManagerResultCompletionBlock = (result:NNDetailModel?, error:NSError?)->()

protocol NNDetailManagerProtocol {

    func findItem(usingPredicate:NSPredicate, completion:NNDetailManagerResultCompletionBlock)
}

protocol NNDetailInteractorOutputProtocol {

    func presentDetail(detail:NNDetailModel)

}

protocol NNDetailModuleProtocol {

    var saveOutput: NNDetailModuleSaveOutput? { get set}
    var cancelOutput: NNDetailModuleCancelAddDetailOutput? {get set}
    var detail: NNDetailModel? { get set }
    var presenter:NNDetailPresenterProtocol { get set}

    func makeRoot()->UIViewController
    func pushFrom(navigationController:UINavigationController)
    func popFrom(navigationController:UINavigationController)

    var view: UIViewController { get }
    var rootWindow: UIWindow { get }

}

protocol NNDetailViewProtocol {

    var viewController: UIViewController { get }
    var output:NNDetailPresenterProtocol? { get set }

    var nameValue:String? { get set }
    var sampleError:String? { get set }

}

protocol NNDetailPresenterOutputProtocol {

}

protocol NNDetailPresenterProtocol {

    var viewController: UIViewController { get }
    var output:NNDetailPresenterOutputProtocol? { get set }
    var detail: NNDetailModel? { get set }
    func viewHasBeenLoaded()

    init(view:NNDetailViewProtocol, interactor:NNDetailInteractorProtocol)

    func presentError(error:NSError)

    func nameChanged(value:String)
    func saveItem(sender:AnyObject?)

}



