//
//  NNSuperbInteractor.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 08/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation

class NNSuperbInteractor: NSObject, NNSuperbInteractorProtocol {

	//MARK: - NSObject
    override init() {
        
        //datamanager = NNSuperbManager()

        super.init()
    }
    
    deinit {
        
    }

	//MARK: - NNSuperbInteractorProtocol
    var output:NNSuperbInteractorOutputProtocol?

    func fetchData(predicate: NSPredicate) {

        let detail = NNSuperbModel(nameValue:"Test")
        self.output?.presentDetail(detail)
    }

    func changeName(name: String, forDetail: NNSuperbModel?) {

    }


}
