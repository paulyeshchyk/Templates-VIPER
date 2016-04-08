//
//  NNSuperbManager.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 08/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation

let NNSuperbManagerErrorDomain:String = "NNSuperbManagerErrorDomain"
let NNSuperbManagerErrorCodeNothingFound = 1
let NNSuperbManagerErrorDescriptionNothingFound = "found no items"


class NNSuperbManager: NSObject, NNSuperbManagerProtocol {

    var cache  = [NNSuperbModel] ()
    
	//MARK: - NSObject
    override init() {
        
        super.init()
        
        self.cache.append(NNSuperbModel(nameValue: "Test"))
        self.cache.append(NNSuperbModel(nameValue: "Test1"))
        self.cache.append(NNSuperbModel(nameValue: "Test2"))
    }
    
    deinit {
        
    }
    
	//MARK: - SampleVIPERListDetailManagerProtocol
    func findItem(usingPredicate:NSPredicate, completion:NNSuperbManagerResultCompletionBlock) {
        
        let result = (self.cache as NSArray).filteredArrayUsingPredicate(usingPredicate)
        guard let item = result.last as? NNSuperbModel else {
            
            let userInfo:[NSString:AnyObject] = [NSLocalizedDescriptionKey:NNSuperbManagerErrorDescriptionNothingFound]
            completion(result: nil, error: NSError(domain: NNSuperbManagerErrorDomain, code: NNSuperbManagerErrorCodeNothingFound, userInfo: userInfo))
            return
        }
    
        completion(result: item, error: nil)
    }
    
}
