//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class ___FILEBASENAMEASIDENTIFIER___Presenter: NSObject, ___FILEBASENAMEASIDENTIFIER___PresenterProtocol {
    
    //MARK: - NSObject
    
    deinit {
        
        rootInteractor.output = nil
    }
    
    //MARK: - ___FILEBASENAMEASIDENTIFIER___PresenterProtocol
    
    var rootView:___FILEBASENAMEASIDENTIFIER___ViewProtocol
    var rootInteractor:___FILEBASENAMEASIDENTIFIER___InteractorProtocol
    var output:___FILEBASENAMEASIDENTIFIER___PresenterOutputProtocol?
    
    required init(view: ___FILEBASENAMEASIDENTIFIER___ViewProtocol, interactor: ___FILEBASENAMEASIDENTIFIER___InteractorProtocol) {
        
        rootView = view
        rootInteractor = interactor
        
        super.init()
        
        rootInteractor.output = self
        
    }
    
    func viewHasBeenLoaded() {
        
        self.rootInteractor.fetchData()
    }
    
    func presentDetail(detail:___FILEBASENAMEASIDENTIFIER___Model) {
        
        self.rootView.sampleProperty = detail.name
        self.rootView.sampleError = nil
    }
    
    func presentError(error: NSError) {
        
        self.rootView.sampleProperty = nil
        self.rootView.sampleError = error.localizedDescription
    }
    
}
