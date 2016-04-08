//
//  NNSuperbModule.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 08/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation
import UIKit

class NNSuperbModule: NSObject, NNSuperbModuleProtocol, NNSuperbPresenterOutputProtocol {

	//MARK: - NSObject
	    
    deinit {
        
        rootView.output = nil
        presenter.output = nil
    }

	//MARK: - NNSuperbModuleProtocol
	
    var rootWindow:UIWindow
    var presenter:NNSuperbPresenterProtocol
    var rootView:NNSuperbViewProtocol
    var rootInteractor:NNSuperbInteractorProtocol
    var view: UIViewController {
        
        get {
            
            return self.rootView.viewController
        }
    }
    var saveOutput: NNSuperbModuleSaveOutput?
    var cancelOutput: NNSuperbModuleCancelAddDetailOutput?


    var detail: NNSuperbModel? {

        didSet {

            self.presenter.detail = self.detail
        }
    }

    required init(window:UIWindow) {
        
        rootWindow = window
        rootInteractor = NNSuperbInteractor()
        
        rootView = NNSuperbViewController(nibName:"NNSuperbViewController", bundle: NSBundle.mainBundle())
        presenter = NNSuperbPresenter(view: rootView, interactor:rootInteractor)
        rootView.output = presenter
        
        super.init()

        presenter.output = self
    }

    func pushFrom(navigationController:UINavigationController) {

        navigationController.pushViewController(self.view, animated: true)
    }

    func popFrom(navigationController: UINavigationController) {

        navigationController.popViewControllerAnimated(true)
    }

    func makeRoot() -> UIViewController{

        rootWindow.rootViewController = self.view
        rootWindow.makeKeyAndVisible()
        return self.view
    }
}
