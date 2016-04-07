//
//  NNDetailProtocols.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 07/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation
import UIKit

typealias NNDetailModuleSaveOutput = (detail:NNDetailModel)->()
typealias NNDetailModuleCancelAddDetailOutput = ()->()

protocol NNDetailInteractorProtocol {

    var output:NNDetailPresenterProtocol? { get set }
    func fetchData(forDetail:NNDetailModel?)
}

typealias NNDetailManagerResultCompletionBlock = (result:NNDetailModel?, error:NSError?)->()

protocol NNDetailManagerProtocol {

    func findItem(usingPredicate:NSPredicate, completion:NNDetailManagerResultCompletionBlock)
}

protocol NNDetailModuleProtocol:ModuleProtocol {

    var saveOutput: NNDetailModuleSaveOutput? { get set}
    var cancelOutput: NNDetailModuleCancelAddDetailOutput? {get set}
    var detail: NNDetailModel? { get set }
    var view:UIViewController { get }
    var presenter:NNDetailPresenterProtocol { get set}
}

protocol NNDetailViewProtocol:ViewProtocol {

    var output:NNDetailPresenterProtocol? { get set }

    var nameValue:String? { get set }
    var sampleError:String? { get set }

}

protocol NNDetailPresenterOutputProtocol {

}

protocol NNDetailPresenterProtocol:PresenterProtocol, ViewOutputProtocol {

    var output:NNDetailPresenterOutputProtocol? { get set }
    var detail: NNDetailModel? { get set }

    init(view:NNDetailViewProtocol, interactor:NNDetailInteractorProtocol)
    func presentDetail(detail:NNDetailModel)
    func presentError(error:NSError)
}



