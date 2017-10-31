//
//  RegistrationVC.swift
//  HW4
//
//  Created by Sumeet Dhakan on 10/24/17.
//  Copyright © 2017 livia. All rights reserved.
//

import UIKit


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
    }
    
    
    @IBAction func registerButton(_ sender: Any) {
        
        userEmail = emailTextField.text!
       // print("\(userEmail)")
       
        userPassword = passwordTextField.text!
        userRepeatPassword = repeatpasswordTextField.text!
        print("Pressed")
        
       // check for empty fields
       if (userEmail.isEmpty || userPassword.isEmpty || userRepeatPassword.isEmpty){
        // Alert message that all fields are required
        print("empty")
        msgAlert(title: "Alert!", text: "All fields are required")
        
        }
        
        
      // Store data
        //UserDefaults.standard.set(userEmail,forKey:"userEmail")
       // UserDefaults.standard.synchronize()
       // let emailStored = UserDefaults.standard.string(forKey: userEmail)
      //  print(emailStored!)
        
        
    }
    
    func msgAlert (title:String, text: String){
        print("Being used")
        let alert = UIAlertController.init(title: title, message: text, preferredStyle: .alert)
        let alertAction = UIAlertAction.init(title: "OK", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)

    }

}
