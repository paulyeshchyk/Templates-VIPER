//
//  NNDetailInteractor.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 07/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation

class NNDetailInteractor: NSObject, NNDetailInteractorProtocol {

	//MARK: - NSObject
    override init() {
        
        //datamanager = NNDetailManager()

        super.init()
    }
    
    deinit {
        
    }

	//MARK: - NNDetailInteractorProtocol
    var output:NNDetailPresenterProtocol?

    func fetchData(forDetail:NNDetailModel?) {
		
		// ask datamanager for new data
		//...
		//call output's dataHasBeenFetched() when done

        //let predicate = NSPredicate(format: "name == %@", argumentArray: ["Test2"])
        //datamanager.findItem(predicate) { (result, error) in
        //
        //    guard let detail = result else {
        //
        //        guard let err = error  else {
        //
        //            return
        //        }
        //
        //        self.output?.presentError(err)
        //
        //        return
        //    }
        //
        //    self.output?.presentDetail(detail)
        //}

        guard let detail = forDetail else {

            return
        }

        self.output?.presentDetail(detail)
    }

}
