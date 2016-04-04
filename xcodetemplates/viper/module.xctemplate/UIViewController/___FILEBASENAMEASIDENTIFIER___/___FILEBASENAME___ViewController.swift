//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class ___FILEBASENAMEASIDENTIFIER___ViewController: UIViewController, ___FILEBASENAMEASIDENTIFIER___ViewProtocol, UITextFieldDelegate  {
    
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
    
    //MARK: - ___FILEBASENAMEASIDENTIFIER___ViewProtocol
    var output:___FILEBASENAMEASIDENTIFIER___PresenterProtocol?
    
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
