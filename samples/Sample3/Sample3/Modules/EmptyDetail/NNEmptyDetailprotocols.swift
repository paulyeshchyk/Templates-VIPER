//
//  NNEmptyDetailprotocols.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 05/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation
import UIKit

protocol NNEmptyDetailModuleProtocol:ModuleProtocol {

    var presenter:NNEmptyDetailPresenterProtocol {get set}

}

protocol NNEmptyDetailPresenterProtocol:PresenterProtocol {

    init(view:NNEmptyDetailViewProtocol, interactor:NNEmptyDetailInteractorProtocol)
}

protocol NNEmptyDetailViewProtocol:ViewProtocol {

}

protocol NNEmptyDetailInteractorProtocol {

}