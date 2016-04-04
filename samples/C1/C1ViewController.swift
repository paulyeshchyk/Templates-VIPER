//
//  C1ViewController.swift
//  
//
//  Created by Pavel Yeshchyk on 3/31/16.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

import UIKit

class C1ViewController: UIViewController, C1ViewProtocol, UITextFieldDelegate  {
    
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
    
    //MARK: - C1ViewProtocol
    var output:C1PresenterProtocol?
    
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
