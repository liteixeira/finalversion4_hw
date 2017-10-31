//
//  RegistrationVC.swift
//  HW4
//
//  Created by Sumeet Dhakan on 10/24/17.
//  Copyright © 2017 livia. All rights reserved.
//

import UIKit

// Declaration of variables
var userEmail:String = ""
var userPassword:String = ""
var userRepeatPassword:String = ""


class RegistrationVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var repeatpasswordTextField: UITextField!
    
    // Hide keyboard when user touches outside the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    } // end of touchesBegan
    
    
    @IBAction func registerButton(_ sender: Any) {
        
    // Testing if register button was pressed
        print("Pressed")
        
      ////////////////////////// Extractes text fields /////////////////
        userEmail = emailTextField.text!
        userPassword = passwordTextField.text!
        userRepeatPassword = repeatpasswordTextField.text!
      ///////////////////////////////////////////////////////////////////
        
        
      ////////////////////////// Check for empty fields and create an alert msg for user //////////////////////////
       if (userEmail.isEmpty || userPassword.isEmpty || userRepeatPassword.isEmpty){
        // Alert message that all fields are required
        print("empty")
        msgAlert(title: "Alert!", text: "All fields are required")
        }
       ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        
        
      ////// Check if password is == repeat password and alert text confirming successful registration //////////
        if userPassword != userRepeatPassword {
            msgAlert(title: "Warning!", text: "Password and repeat password are different. Type again")
        } else {
            msgConfirmation(title: "Confirmation", text: "You successfully registered")
        }
       //////////////////////////////////////////////////////////////////////////////////////////////////////////
      
        // Store data
        //UserDefaults.standard.set(userEmail,forKey:"userEmail")
       // UserDefaults.standard.synchronize()
       // let emailStored = UserDefaults.standard.string(forKey: userEmail)
      //  print(emailStored!)
        
        
    } // end of registerButton
    
    /////////////////////////////////// Function msgConfirmation generates confirmation text /////////////////////////////
    
    func msgConfirmation (title:String, text:String) {
        print("Being used")
        let confirmation = UIAlertController.init(title: title, message: text, preferredStyle: .alert)
        let confirmationAction = UIAlertAction.init(title: "OK", style: .default) { (action) in
            confirmation.dismiss(animated: true, completion: nil)
            self.navigationController?.popViewController(animated: true)
        }
        confirmation.addAction(confirmationAction)
        present(confirmation, animated: true, completion: nil)
    }
    
    //////////////////////////////////// Function msgAlert generates alert text /////////////////////////////
    func msgAlert (title:String, text: String){
        print("Being used")
        let alert = UIAlertController.init(title: title, message: text, preferredStyle: .alert)
        let alertAction = UIAlertAction.init(title: "OK", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)

    } // end of msgAlert
   //////////////////////////////////////////////////////////////////////////////////////////////////////////
    
} // end of RegistrationVC
