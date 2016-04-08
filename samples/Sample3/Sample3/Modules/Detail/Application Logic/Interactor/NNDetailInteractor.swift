//
//  NNDetailInteractor.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 08/04/2016.
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
    var output:NNDetailInteractorOutputProtocol?

    func fetchData(predicate: NSPredicate) {


        let detail = NNDetailModel(nameValue:"Test")
        self.output?.presentDetail(detail)
    }

    func changeName(name: String, forDetail: NNDetailModel?) {

    }


}
