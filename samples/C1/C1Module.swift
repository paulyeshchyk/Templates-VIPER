//
//  C1Module.swift
//  
//
//  Created by Pavel Yeshchyk on 3/31/16.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

import Foundation
import UIKit

class C1Module: NSObject, C1ModuleProtocol, C1PresenterOutputProtocol {
    
    //MARK: - NSObject
    
    deinit {
        
        rootView.output = nil
        rootPresenter.output = nil
    }
    
    //MARK: - C1ModuleProtocol
    
    var rootPresenter:C1PresenterProtocol
    var rootView:C1ViewProtocol
    var rootInteractor:C1InteractorProtocol
    var view: UIViewController {
        
        get {
            
            return self.rootView.viewController
        }
    }
    
    override init() {
        
        rootInteractor = C1Interactor()
        
        rootView = C1ViewController(nibName:"C1ViewController", bundle: NSBundle.mainBundle())
        rootPresenter = C1Presenter(view: rootView, interactor:rootInteractor)
        rootView.output = rootPresenter
        
        super.init()
        
        rootPresenter.output = self
        
    }
}
