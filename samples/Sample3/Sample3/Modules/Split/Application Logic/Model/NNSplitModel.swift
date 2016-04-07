//
//  NNSplitModel.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 07/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import UIKit

class NNSplitModel: NSObject {

    var ident:String
    var text:String

    required init(aIdent:String, aText:String) {

        ident = aIdent
        text = aText
    }

}
