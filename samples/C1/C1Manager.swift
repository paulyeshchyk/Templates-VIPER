//
//  C1Manager.swift
//  
//
//  Created by Pavel Yeshchyk on 3/31/16.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

import Foundation

let C1ManagerErrorDomain:String = "C1ManagerErrorDomain"
let C1ManagerErrorCodeNothingFound = 1
let C1ManagerErrorDescriptionNothingFound = "found no items"


class C1Manager: NSObject, C1ManagerProtocol {
    
    var cache  = [C1Model] ()
    
    //MARK: - NSObject
    override init() {
        
        super.init()
        
        self.cache.append(C1Model(nameValue: "Test"))
        self.cache.append(C1Model(nameValue: "Test1"))
        self.cache.append(C1Model(nameValue: "Test2"))
    }
    
    deinit {
        
    }
    
    //MARK: - SampleVIPERListDetailManagerProtocol
    func findItem(usingPredicate:NSPredicate, completion:C1ManagerResultCompletionBlock) {
        
        let result = (self.cache as NSArray).filteredArrayUsingPredicate(usingPredicate)
        guard let item = result.last as? C1Model else {
            
            let userInfo:[NSString:AnyObject] = [NSLocalizedDescriptionKey:C1ManagerErrorDescriptionNothingFound]
            completion(result: nil, error: NSError(domain: C1ManagerErrorDomain, code: C1ManagerErrorCodeNothingFound, userInfo: userInfo))
            return
        }
        
        completion(result: item, error: nil)
    }
    
}
