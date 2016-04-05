//
//  NNDetailProtocols.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 05/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation
import UIKit

protocol NNDetailInteractorProtocol {

    var output:NNDetailPresenterProtocol? { get set }
    func fetchData()
}

typealias NNDetailManagerResultCompletionBlock = (result:NNDetailModel?, error:NSError?)->()

protocol NNDetailManagerProtocol {

    func findItem(usingPredicate:NSPredicate, completion:NNDetailManagerResultCompletionBlock)
}

protocol NNDetailModuleProtocol {

    var view:UIViewController {get}
    var presenter:NNDetailPresenterProtocol { get set}
}

protocol NNDetailViewProtocol {

    var output:NNDetailPresenterProtocol? { get set }
    var viewController:UIViewController { get }
    
    var sampleProperty:String? { get set }
    var sampleError:String? { get set }
}

protocol NNDetailPresenterOutputProtocol {

}

protocol NNDetailPresenterProtocol:PresenterProtocol {

    var output:NNDetailPresenterOutputProtocol? { get set }

    init(view:NNDetailViewProtocol, interactor:NNDetailInteractorProtocol)
	func viewHasBeenLoaded()    
    func presentDetail(detail:NNDetailModel)
    func presentError(error:NSError)
    
}



