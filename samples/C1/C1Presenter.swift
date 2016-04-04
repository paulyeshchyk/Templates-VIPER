//
//  C1Presenter.swift
//  
//
//  Created by Pavel Yeshchyk on 3/31/16.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

import Foundation

class C1Presenter: NSObject, C1PresenterProtocol {
    
    //MARK: - NSObject
    
    deinit {
        
        rootInteractor.output = nil
    }
    
    //MARK: - C1PresenterProtocol
    
    var rootView:C1ViewProtocol
    var rootInteractor:C1InteractorProtocol
    var output:C1PresenterOutputProtocol?
    
    required init(view: C1ViewProtocol, interactor: C1InteractorProtocol) {
        
        rootView = view
        rootInteractor = interactor
        
        super.init()
        
        rootInteractor.output = self
        
    }
    
    func viewHasBeenLoaded() {
        
        self.rootInteractor.fetchData()
    }
    
    func presentDetail(detail:C1Model) {
        
        self.rootView.sampleProperty = detail.name
        self.rootView.sampleError = nil
    }
    
    func presentError(error: NSError) {
        
        self.rootView.sampleProperty = nil
        self.rootView.sampleError = error.localizedDescription
    }
    
}
