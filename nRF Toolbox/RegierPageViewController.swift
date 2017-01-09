//
//  RegisterPageViewController.swift
//  UserLoginAndRegistration
//
//  Created by Anastasis Panagoulias on 04/12/2016.
//  Copyright © 2016 Anastasis Panagoulias. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {
    
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        
        userEmailTextField.inputAccessoryView = toolbar
        userPasswordTextField.inputAccessoryView = toolbar
        repeatPasswordTextField.inputAccessoryView = toolbar
    }
    
    func doneClicked() {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        let userRepeatPassword = repeatPasswordTextField.text
        
        //Check for empty Fields
        
        if((userEmail?.isEmpty)! || (userPassword?.isEmpty)! || (userRepeatPassword?.isEmpty)!) {
            
            //Display Alert Message
            displayMyAlertMessage(userMessage: "All fields are required")
            
            return
        }
        
        //Check if Passwords are a match
        
        if (userPassword != userRepeatPassword) {
            
            //display alert message
            displayMyAlertMessage(userMessage: "Passwords do not match")
            
            return
        }
        //Store Data
        
        UserDefaults.standard.set(userEmail, forKey: "userEmail")
        UserDefaults.standard.set(userPassword, forKey: "userPassword")
        UserDefaults.standard.synchronize()
        
        //Display Alert message with confiramtion
        let myAlert = UIAlertController(title: "Thank You", message: "Registration is succesful.", preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default){ action in
            self.dismiss(animated: true, completion: nil)
        }
        myAlert.addAction(okAction)
        self.present(myAlert, animated:true, completion:nil)
    }
    
    func displayMyAlertMessage(userMessage: String)
    {
        
        
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated:true, completion:nil)
    }
    
    
    @IBAction func alreadyHaveTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
