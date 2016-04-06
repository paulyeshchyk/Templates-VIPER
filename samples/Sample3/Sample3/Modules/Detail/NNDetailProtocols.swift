//
//  NNDetailProtocols.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 06/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation
import UIKit

typealias NNDetailModuleSaveOutput = (detail:NNDetailModel)->()
typealias NNDetailModuleCancelAddDetailOutput = ()->()

protocol NNDetailInteractorProtocol {

    var output:NNDetailPresenterProtocol? { get set }
    func fetchData()
}

typealias NNDetailManagerResultCompletionBlock = (result:NNDetailModel?, error:NSError?)->()

protocol NNDetailManagerProtocol {

    func findItem(usingPredicate:NSPredicate, completion:NNDetailManagerResultCompletionBlock)
}

protocol NNDetailModuleProtocol:ModuleProtocol {

    var saveOutput: NNDetailModuleSaveOutput? { get set}
    var cancelOutput: NNDetailModuleCancelAddDetailOutput? {get set}
    var detail: NNDetailModel? { get set }
    var view:UIViewController {get}
    var presenter:NNDetailPresenterProtocol { get set}
}

protocol NNDetailViewProtocol {

    var output:NNDetailPresenterProtocol? { get set }
    var viewController:UIViewController { get }
    
    var nameValue:String? { get set }
    var sampleError:String? { get set }

    func redrawData()
}

protocol NNDetailPresenterOutputProtocol {

}

protocol NNDetailPresenterProtocol:PresenterProtocol {

    var output:NNDetailPresenterOutputProtocol? { get set }
    var detail: NNDetailModel? { get set }

    init(view:NNDetailViewProtocol, interactor:NNDetailInteractorProtocol)
	func viewHasBeenLoaded()    
    func presentDetail(detail:NNDetailModel)
    func presentError(error:NSError)
}



