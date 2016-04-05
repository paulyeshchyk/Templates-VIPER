//
//  NNDetailInteractor.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 05/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation

class NNDetailInteractor: NSObject, NNDetailInteractorProtocol {

    var datamanager:NNDetailManagerProtocol
    
	//MARK: - NSObject
    override init() {
        
        datamanager = NNDetailManager()

        super.init()
    }
    
    deinit {
        
    }

	//MARK: - NNDetailInteractorProtocol
    var output:NNDetailPresenterProtocol?

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