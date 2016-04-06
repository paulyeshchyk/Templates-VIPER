//
//  NNDetailManager.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 06/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation

let NNDetailManagerErrorDomain:String = "NNDetailManagerErrorDomain"
let NNDetailManagerErrorCodeNothingFound = 1
let NNDetailManagerErrorDescriptionNothingFound = "found no items"


class NNDetailManager: NSObject, NNDetailManagerProtocol {

    var cache  = [NNDetailModel] ()
    
	//MARK: - NSObject
    override init() {
        
        super.init()
        
        self.cache.append(NNDetailModel(nameValue: "Test"))
        self.cache.append(NNDetailModel(nameValue: "Test1"))
        self.cache.append(NNDetailModel(nameValue: "Test2"))
    }
    
    deinit {
        
    }
    
	//MARK: - SampleVIPERListDetailManagerProtocol
    func findItem(usingPredicate:NSPredicate, completion:NNDetailManagerResultCompletionBlock) {
        
        let result = (self.cache as NSArray).filteredArrayUsingPredicate(usingPredicate)
        guard let item = result.last as? NNDetailModel else {
            
            let userInfo:[NSString:AnyObject] = [NSLocalizedDescriptionKey:NNDetailManagerErrorDescriptionNothingFound]
            completion(result: nil, error: NSError(domain: NNDetailManagerErrorDomain, code: NNDetailManagerErrorCodeNothingFound, userInfo: userInfo))
            return
        }
    
        completion(result: item, error: nil)
    }
    
}
