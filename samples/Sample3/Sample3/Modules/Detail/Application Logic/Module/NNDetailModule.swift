//
//  NNDetailModule.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 05/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation
import UIKit

class NNDetailModule: NSObject, NNDetailModuleProtocol, NNDetailPresenterOutputProtocol {

	//MARK: - NSObject
	    
    deinit {
        
        rootView.output = nil
        presenter.output = nil
    }

	//MARK: - NNDetailModuleProtocol
	
    var rootWindow:UIWindow
    var presenter:NNDetailPresenterProtocol
    var rootView:NNDetailViewProtocol
    var rootInteractor:NNDetailInteractorProtocol
    var view: UIViewController {
        
        get {
            
            return self.rootView.viewController
        }
    }

    required init(window:UIWindow) {
        
        rootWindow = window
        rootInteractor = NNDetailInteractor()
        
        rootView = NNDetailViewController(nibName:"NNDetailViewController", bundle: NSBundle.mainBundle())
        presenter = NNDetailPresenter(view: rootView, interactor:rootInteractor)
        rootView.output = presenter
        
        super.init()

        presenter.output = self

    }
}