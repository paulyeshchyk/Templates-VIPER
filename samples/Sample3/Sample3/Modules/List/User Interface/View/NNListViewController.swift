//
//  NNListViewController.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 06/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import Foundation
import UIKit

class NNListViewController: UIViewController, NNListViewProtocol, UITableViewDataSource, UITableViewDelegate {


    var input: NNListInteractorProtocol?
    var output: NNListPresenterProtocol? {

        didSet {

            self.invalidate()
        }
    }

    @IBOutlet var tableView:UITableView?

    var viewController:UIViewController {

        get {

            return self
        }
    }

    override func viewDidLoad() {

        super.viewDidLoad()

        let addItem = UIBarButtonItem(barButtonSystemItem:.Add, target: self, action: #selector(NNListViewController.addItem(_:)))
        self.navigationItem.rightBarButtonItems = [addItem]

        self.tableView?.registerNib(UINib(nibName: "NNListCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "NNListCell")
        self.invalidate()
    }


    func invalidate() {

        guard let output = self.output else {

            return
        }

        if (!self.isViewLoaded()) {

            return
        }

        output.fetchData()
    }

    func addItem(sender:AnyObject) {

        let indexPath = self.tableView?.indexPathForSelectedRow
        if (indexPath != nil) {

            self.tableView?.deselectRowAtIndexPath(indexPath!, animated: true)
        }

        self.output?.addItem()
    }

    func reloadTableview() {

        self.tableView?.reloadData()
    }


    //MARK: - UITableViewDatasource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard let input = self.input else {

            return 0
        }
        return input.listItemsCount()
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let data = self.input?.listItemAtIndex(indexPath.row)

        let result = tableView.dequeueReusableCellWithIdentifier("NNListCell")
        result?.textLabel!.text = data!.text

        return result!
    }

    //MARK: - UITableViewDelegate

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        //        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.output?.openDetailAtIndex(indexPath.row)
    }

    func reloadItemAtIndex(index:Int) {

        let indexPath = NSIndexPath(forRow: index, inSection: 0)
        self.tableView?.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .None)
    }
}
