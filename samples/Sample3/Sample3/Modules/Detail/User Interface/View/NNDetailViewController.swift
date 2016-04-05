//
//  NNDetailViewController.swift
//  Sample3.xcodeproj
//
//  Created by Pavel Yeshchyk on 05/04/2016.
//  Copyright 2016 NoName. All rights reserved.
//

import UIKit

class NNDetailViewController: UIViewController, NNDetailViewProtocol, UITextFieldDelegate  {

    @IBOutlet var sampleNameTextField:UITextField?
    @IBOutlet var errorLabel:UILabel?
    @IBOutlet var button:UIButton?

	//MARK: - NSObject
    deinit {
        
    }
    
	//MARK: - UIViewController
    override func viewDidLoad() {
        
        super.viewDidLoad()


		//tell presenter about view load completion
		self.output?.viewHasBeenLoaded()

	}    

    //MARK: - IBActions
    @IBAction func onButtonClicked(sender:AnyObject?) {
        
    }

    //MARK: - UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }

	//MARK: - NNDetailViewProtocol
    var output:NNDetailPresenterProtocol?

    var viewController:UIViewController {
        
        get {
            
            return self
        }
    }
    
    var sampleProperty:String? {

    	didSet {

			self.sampleNameTextField?.text = self.sampleProperty
            
            guard let txt = self.sampleProperty where txt.characters.count > 0 else {
                
                self.button?.enabled = false
                return
            }
            self.button?.enabled = true
    	}
    }
    
    var sampleError:String? {
        
        didSet {
            
            self.errorLabel?.text = self.sampleError
        }
    }

}
