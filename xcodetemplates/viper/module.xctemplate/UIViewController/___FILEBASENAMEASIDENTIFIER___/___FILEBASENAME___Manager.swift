//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

let ___FILEBASENAMEASIDENTIFIER___ManagerErrorDomain:String = "___FILEBASENAMEASIDENTIFIER___ManagerErrorDomain"
let ___FILEBASENAMEASIDENTIFIER___ManagerErrorCodeNothingFound = 1
let ___FILEBASENAMEASIDENTIFIER___ManagerErrorDescriptionNothingFound = "found no items"


class ___FILEBASENAMEASIDENTIFIER___Manager: NSObject, ___FILEBASENAMEASIDENTIFIER___ManagerProtocol {
    
    var cache  = [___FILEBASENAMEASIDENTIFIER___Model] ()
    
    //MARK: - NSObject
    override init() {
        
        super.init()
        
        self.cache.append(___FILEBASENAMEASIDENTIFIER___Model(nameValue: "Test"))
        self.cache.append(___FILEBASENAMEASIDENTIFIER___Model(nameValue: "Test1"))
        self.cache.append(___FILEBASENAMEASIDENTIFIER___Model(nameValue: "Test2"))
    }
    
    deinit {
        
    }
    
    //MARK: - SampleVIPERListDetailManagerProtocol
    func findItem(usingPredicate:NSPredicate, completion:___FILEBASENAMEASIDENTIFIER___ManagerResultCompletionBlock) {
        
        let result = (self.cache as NSArray).filteredArrayUsingPredicate(usingPredicate)
        guard let item = result.last as? ___FILEBASENAMEASIDENTIFIER___Model else {
            
            let userInfo:[NSString:AnyObject] = [NSLocalizedDescriptionKey:___FILEBASENAMEASIDENTIFIER___ManagerErrorDescriptionNothingFound]
            completion(result: nil, error: NSError(domain: ___FILEBASENAMEASIDENTIFIER___ManagerErrorDomain, code: ___FILEBASENAMEASIDENTIFIER___ManagerErrorCodeNothingFound, userInfo: userInfo))
            return
        }
        
        completion(result: item, error: nil)
    }
    
}
