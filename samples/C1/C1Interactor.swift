//
//  C1Interactor.swift
//  
//
//  Created by Pavel Yeshchyk on 3/31/16.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

import Foundation

class C1Interactor: NSObject, C1InteractorProtocol {
    
    var datamanager:C1ManagerProtocol
    
    //MARK: - NSObject
    override init() {
        
        datamanager = C1Manager()
        
        super.init()
    }
    
    deinit {
        
    }
    
    //MARK: - C1InteractorProtocol
    var output:C1PresenterProtocol?
    
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
