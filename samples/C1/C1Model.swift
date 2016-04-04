//
//  C1Model.swift
//  
//
//  Created by Pavel Yeshchyk on 3/31/16.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

import Foundation

class C1Model: NSObject {
    
    var name:String
    
    //MARK: - NSObject
    required init(nameValue:String) {
        
        name = nameValue
        super.init()
    }
    
    deinit {
        
    }
}
