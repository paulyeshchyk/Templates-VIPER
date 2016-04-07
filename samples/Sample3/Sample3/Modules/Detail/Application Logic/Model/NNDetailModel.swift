//
//  NNDetailModel.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 07/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation

class NNDetailModel: NSObject {

    var name:String

    //MARK: - NSObject
    required init(nameValue:String) {
        
        name = nameValue
        super.init()
    }
    
    deinit {
        
    }
}
