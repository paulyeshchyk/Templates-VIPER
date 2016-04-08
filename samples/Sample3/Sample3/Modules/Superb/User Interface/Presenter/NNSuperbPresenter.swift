//
//  NNSuperbPresenter.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 08/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation
import UIKit

class NNSuperbPresenter: NSObject, NNSuperbPresenterProtocol, NNSuperbInteractorOutputProtocol {

	//MARK: - NSObject    
	
    deinit {
        
        rootInteractor.output = nil
    }

	//MARK: - NNSuperbPresenterProtocol
	    
    var rootView:NNSuperbViewProtocol
    var rootInteractor:NNSuperbInteractorProtocol
    var output:NNSuperbPresenterOutputProtocol? 
    var viewController: UIViewController {

        get {

            let result = UINavigationController(rootViewController: rootView.viewController)
            return result
        }
    }

    var detail: NNSuperbModel? {

        didSet {

            let predicate = NSPredicate(format: "name == %@", argumentArray: ["Test"])
            self.rootInteractor.fetchData(predicate)
        }
    }

    required init(view: NNSuperbViewProtocol, interactor: NNSuperbInteractorProtocol) {

        rootView = view
        rootInteractor = interactor
        
        super.init()

        rootInteractor.output = self
        
    }

    func viewHasBeenLoaded() {
        
        let saveItem = UIBarButtonItem(barButtonSystemItem:.Save, target: self, action: #selector(NNSuperbPresenter.saveItem(_:)))
        self.rootView.viewController.navigationItem.rightBarButtonItems = [saveItem]

        let predicate = NSPredicate(format: "name == %@", argumentArray: ["Test"])
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

    //MARK: - NNSuperbInteractorOutputProtocol

    func presentDetail(detail:NNSuperbModel) {

        self.rootView.nameValue = detail.name
        self.rootView.sampleError = nil
    }
}
