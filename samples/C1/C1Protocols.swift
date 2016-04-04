//
//  C1Protocols.swift
//  
//
//  Created by Pavel Yeshchyk on 3/31/16.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

import Foundation
import UIKit

protocol C1InteractorProtocol {
    
    var output:C1PresenterProtocol? { get set }
    func fetchData()
}

typealias C1ManagerResultCompletionBlock = (result:C1Model?, error:NSError?)->()

protocol C1ManagerProtocol {
    
    func findItem(usingPredicate:NSPredicate, completion:C1ManagerResultCompletionBlock)
}

protocol C1ModuleProtocol {
    
    var view:UIViewController {get}
}

protocol C1ViewProtocol {
    
    var output:C1PresenterProtocol? { get set }
    var viewController:UIViewController { get }
    
    var sampleProperty:String? { get set }
    var sampleError:String? { get set }
}

protocol C1PresenterOutputProtocol {
    
}

protocol C1PresenterProtocol {
    
    var output:C1PresenterOutputProtocol? { get set }
    
    init(view:C1ViewProtocol, interactor:C1InteractorProtocol)
    func viewHasBeenLoaded()
    func presentDetail(detail:C1Model)
    func presentError(error:NSError)
    
}



