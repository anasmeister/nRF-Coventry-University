//
//  LoginViewController.swift
//  UserLoginAndRegistration
//
//  Created by Anastasis Panagoulias on 05/12/2016.
//  Copyright © 2016 Anastasis Panagoulias. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        
        userEmailTextField.inputAccessoryView = toolbar
        userPasswordTextField.inputAccessoryView = toolbar
    }
    
    func doneClicked() {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        let userEmail = userEmailTextField.text
        //print (userEmail!)
        let userPassword = userPasswordTextField.text
        //print (userPassword!)
        
        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail")
        
        if((userEmail?.isEmpty)! || (userPassword?.isEmpty)!) {
            
            //Display Alert Message
            displayMyAlertMessage(userMessage: "All fields are required")
            
            return
        }
        
        
        //print (userEmailStored)
        
        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword")
        
        if (userEmailStored == userEmail) {
            if (userPasswordStored == userPassword)
            {
                //Login is successful
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                UserDefaults.standard.synchronize()
                self.dismiss(animated: true, completion: nil)
            } else {
                displayMyAlertMessage(userMessage: "The password you entered is wrong")
            }
        } else {
            displayMyAlertMessage(userMessage: "The is no user with that username")
        }
        
    }
    
    
    func displayMyAlertMessage(userMessage: String)
    {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated:true, completion:nil)
    }
    
    
    
}
