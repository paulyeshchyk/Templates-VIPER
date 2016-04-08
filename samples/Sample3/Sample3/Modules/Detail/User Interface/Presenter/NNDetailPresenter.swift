//
//  NNDetailPresenter.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 08/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation
import UIKit

class NNDetailPresenter: NSObject, NNDetailPresenterProtocol, NNDetailInteractorOutputProtocol {

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

            let predicate = NSPredicate (format: "nameValue == %@", argumentArray: ["Test"])
            self.rootInteractor.fetchData(predicate)
        }
    }

    required init(view: NNDetailViewProtocol, interactor: NNDetailInteractorProtocol) {

        rootView = view
        rootInteractor = interactor
        
        super.init()

        rootInteractor.output = self
        
    }

    func viewHasBeenLoaded() {
        
        let saveItem = UIBarButtonItem(barButtonSystemItem:.Save, target: self, action: #selector(NNDetailPresenter.saveItem(_:)))
        self.rootView.viewController.navigationItem.rightBarButtonItems = [saveItem]

        let predicate = NSPredicate (format: "nameValue == %@", argumentArray: ["Test"])
        self.rootInteractor.fetchData(predicate)
    }

    func nameChanged(value: String) {

        self.rootInteractor.changeName(value, forDetail: self.detail)
    }

    func saveItem(sender:AnyObject?) {

    }

    func presentError(error: NSError) {
        
        self.rootView.nameValue = nil
        self.rootView.sampleError = error.localizedDescription
    }

    //MARK: - NNDetailInteractorOutputProtocol
    func presentDetail(detail:NNDetailModel) {

        self.rootView.nameValue = detail.name
        self.rootView.sampleError = nil
    }
}
