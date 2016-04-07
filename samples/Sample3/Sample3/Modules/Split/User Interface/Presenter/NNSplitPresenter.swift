//
//  NNSplitPresenter.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 07/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation
import UIKit

class NNSplitPresenter: NSObject, NNSplitPresenterProtocol {

    var splitView: NNSplitViewProtocol
    var interactor: NNSplitInteractorProtocol?
    var selectedItem: NNSplitModel? {

        didSet {

            self.interactor?.selectedItem = self.selectedItem
            self.rebuildPresenters()
        }
    }

    var masterPresenter:PresenterProtocol? {

        didSet {

            self.rebuildPresenters()
        }
    }

    var detailPresenter:PresenterProtocol? {

        didSet {

            self.rebuildPresenters()
        }
    }

    var emptyDetailPresenter:PresenterProtocol? {

        didSet {

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

        guard let master = self.masterPresenter else {

            return
        }
        vcs.append(master.viewController)


        let hasSelectedItem = interactor.selectedItem

        if ((hasSelectedItem != nil) && hasSelectedItem?.text.characters.count != 0) {

            guard let detail = self.detailPresenter else {

                return
            }

            vcs.append(detail.viewController)
        } else {

            guard let emptyDetail = self.emptyDetailPresenter else {

                return
            }
            vcs.append(emptyDetail.viewController)
        }

        splitView.setSplittedControllers(vcs)
    }
}

