//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

protocol ___FILEBASENAMEASIDENTIFIER___InteractorProtocol {
    
    var output:___FILEBASENAMEASIDENTIFIER___PresenterProtocol? { get set }
    func fetchData()
}

typealias ___FILEBASENAMEASIDENTIFIER___ManagerResultCompletionBlock = (result:___FILEBASENAMEASIDENTIFIER___Model?, error:NSError?)->()

protocol ___FILEBASENAMEASIDENTIFIER___ManagerProtocol {
    
    func findItem(usingPredicate:NSPredicate, completion:___FILEBASENAMEASIDENTIFIER___ManagerResultCompletionBlock)
}

protocol ___FILEBASENAMEASIDENTIFIER___ModuleProtocol {
    
    var view:UIViewController {get}
}

protocol ___FILEBASENAMEASIDENTIFIER___ViewProtocol {
    
    var output:___FILEBASENAMEASIDENTIFIER___PresenterProtocol? { get set }
    var viewController:UIViewController { get }
    
    var sampleProperty:String? { get set }
    var sampleError:String? { get set }
}

protocol ___FILEBASENAMEASIDENTIFIER___PresenterOutputProtocol {
    
}

protocol ___FILEBASENAMEASIDENTIFIER___PresenterProtocol {
    
    var output:___FILEBASENAMEASIDENTIFIER___PresenterOutputProtocol? { get set }
    
    init(view:___FILEBASENAMEASIDENTIFIER___ViewProtocol, interactor:___FILEBASENAMEASIDENTIFIER___InteractorProtocol)
    func viewHasBeenLoaded()
    func presentDetail(detail:___FILEBASENAMEASIDENTIFIER___Model)
    func presentError(error:NSError)
    
}



