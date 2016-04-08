//
//  NNSplitPresenter.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 08/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation
import UIKit

class NNSplitPresenter: NSObject, NNSplitPresenterProtocol {

    var presenterOutput: NNSplitViewPresenterOutput?
    var splitView: NNSplitViewProtocol
    var interactor: NNSplitInteractorProtocol?
    var selectedItem: NNSplitModel? {

        didSet {

            self.interactor?.selectedItem = self.selectedItem
            self.rebuildPresenters()
        }
    }

    var viewController: UIViewController {

        get {

            return splitView.viewController
        }
    }

    required init(view:NNSplitViewProtocol, splitInteractor:NNSplitInteractorProtocol) {

        splitView = view
        interactor = splitInteractor
    }


    //MARK: - private

    func rebuildPresenters() {

        guard let interactor = self.interactor else {

            return
        }

        var vcs:[UIViewController] = []

        guard let output = self.presenterOutput else {
            
            return
        }
        
        guard let masterViewCallback = output.masterViewCallback else {
            
            return
        }
        
        let masterView = masterViewCallback()
        vcs.append(masterView)


        let hasSelectedItem = interactor.selectedItem

        if ((hasSelectedItem != nil) && hasSelectedItem?.text.characters.count != 0) {

            guard let detailViewCallback = output.detailViewCallback else {
                
                return
            }

            let detail = detailViewCallback()
            vcs.append(detail)
        } else {

            guard let emptyViewCallback = output.emptyViewCallback else {
                
                return
            }
            
            let empty = emptyViewCallback()
            vcs.append(empty)
        }

        splitView.setSplittedControllers(vcs)
    }
}

