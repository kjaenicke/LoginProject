//
//  CreateAccountViewController.swift
//  LoginProject
//
//  Created by Keenan Jaenicke on 1/25/15.
//  Copyright (c) 2015 Keenan Jaenicke. All rights reserved.
//

import UIKit

protocol CreateAccountViewControllerDelegate {
    func accountCreated ()
}

class CreateAccountViewController: UIViewController {
    @IBOutlet weak var chooseUsernameTextField: UITextField!
    @IBOutlet weak var choosePasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    var delegate:CreateAccountViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createAccountButtonPressed(sender: AnyObject) {
        if(choosePasswordTextField.text == confirmPasswordTextField.text && choosePasswordTextField.text != nil){
            
            //good practice to set up keys as constants
            NSUserDefaults.standardUserDefaults().setObject(self.chooseUsernameTextField.text, forKey: kUsernameKey)
            NSUserDefaults.standardUserDefaults().setObject(self.choosePasswordTextField.text, forKey: kPasswordKey)
            
            //save user defaults
            NSUserDefaults.standardUserDefaults().synchronize()
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
            delegate?.accountCreated()
        }
    }

    @IBAction func cancelButtonPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

}
