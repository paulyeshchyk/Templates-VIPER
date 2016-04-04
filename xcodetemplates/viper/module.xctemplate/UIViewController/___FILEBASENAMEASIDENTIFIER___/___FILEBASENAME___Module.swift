//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

class ___FILEBASENAMEASIDENTIFIER___Module: NSObject, ___FILEBASENAMEASIDENTIFIER___ModuleProtocol, ___FILEBASENAMEASIDENTIFIER___PresenterOutputProtocol {
    
    //MARK: - NSObject
    
    deinit {
        
        rootView.output = nil
        rootPresenter.output = nil
    }
    
    //MARK: - ___FILEBASENAMEASIDENTIFIER___ModuleProtocol
    
    var rootPresenter:___FILEBASENAMEASIDENTIFIER___PresenterProtocol
    var rootView:___FILEBASENAMEASIDENTIFIER___ViewProtocol
    var rootInteractor:___FILEBASENAMEASIDENTIFIER___InteractorProtocol
    var view: UIViewController {
        
        get {
            
            return self.rootView.viewController
        }
    }
    
    override init() {
        
        rootInteractor = ___FILEBASENAMEASIDENTIFIER___Interactor()
        
        rootView = ___FILEBASENAMEASIDENTIFIER___ViewController(nibName:"___FILEBASENAMEASIDENTIFIER___ViewController", bundle: NSBundle.mainBundle())
        rootPresenter = ___FILEBASENAMEASIDENTIFIER___Presenter(view: rootView, interactor:rootInteractor)
        rootView.output = rootPresenter
        
        super.init()
        
        rootPresenter.output = self
        
    }
}
