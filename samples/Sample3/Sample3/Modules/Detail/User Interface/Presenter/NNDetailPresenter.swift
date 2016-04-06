//
//  NNDetailPresenter.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 06/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation
import UIKit

class NNDetailPresenter: NSObject, NNDetailPresenterProtocol {

	//MARK: - NSObject    
	
    deinit {
        
        rootInteractor.output = nil
    }

	//MARK: - NNDetailPresenterProtocol
	    
    var rootView:NNDetailViewProtocol
    var rootInteractor:NNDetailInteractorProtocol
    var output:NNDetailPresenterOutputProtocol? 
    var viewController: UIViewController {

        get {

            let result = UINavigationController(rootViewController: rootView.viewController)
            return result
        }
    }

    var detail: NNDetailModel? {

        didSet {

            rootView.nameValue = detail?.name
            //rootView.identValue = detail?.ident
            rootView.redrawData()
        }
    }

    required init(view: NNDetailViewProtocol, interactor: NNDetailInteractorProtocol) {

        rootView = view
        rootInteractor = interactor
        
        super.init()

        rootInteractor.output = self
        
    }

    func viewHasBeenLoaded() {
        
        self.rootInteractor.fetchData()
    }
    
    func presentDetail(detail:NNDetailModel) {

		self.rootView.nameValue = detail.name
        self.rootView.sampleError = nil
    }
    
    func presentError(error: NSError) {
        
        self.rootView.nameValue = nil
        self.rootView.sampleError = error.localizedDescription
    }
    
}
