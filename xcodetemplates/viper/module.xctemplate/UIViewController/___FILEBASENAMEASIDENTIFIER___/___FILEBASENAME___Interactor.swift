//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class ___FILEBASENAMEASIDENTIFIER___Interactor: NSObject, ___FILEBASENAMEASIDENTIFIER___InteractorProtocol {
    
    var datamanager:___FILEBASENAMEASIDENTIFIER___ManagerProtocol
    
    //MARK: - NSObject
    override init() {
        
        datamanager = ___FILEBASENAMEASIDENTIFIER___Manager()
        
        super.init()
    }
    
    deinit {
        
    }
    
    //MARK: - ___FILEBASENAMEASIDENTIFIER___InteractorProtocol
    var output:___FILEBASENAMEASIDENTIFIER___PresenterProtocol?
    
    func fetchData() {
        
        // ask datamanager for new data
        //...
        //call output's dataHasBeenFetched() when done
        
        let predicate = NSPredicate(format: "name == %@", argumentArray: ["Test2"])
        datamanager.findItem(predicate) { (result, error) in
            
            guard let detail = result else {
                
                guard let err = error  else {
                    
                    return
                }
                
                self.output?.presentError(err)
                
                return
            }
            
            self.output?.presentDetail(detail)
        }
    }
    
}
