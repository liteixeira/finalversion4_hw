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
var track:String = ""
var user_Login = [LoginData]()
// var mutable_Login:NSMutableArray = [LoginData(email: userEmail, password: userPassword, usertype: track)]
//var mutable_Login = NSMutableArray()
var store_Email = [String]()
var store_Password = [String]()
var store_Track = [String]()

class RegistrationVC: UIViewController {
    
    @IBOutlet weak var helperButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var beneficiaryButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var organizationButton: UIButton!
    @IBOutlet weak var repeatpasswordTextField: UITextField!
    
    
    @IBAction func beneficiaryPressed(_ sender: UIButton) {
        
        beneficiaryButton.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.5, blue: 0.5, alpha: 1.0)
        beneficiaryButton.setTitleColor(UIColor.white, for: .normal)
        helperButton.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.5, blue: 0.5, alpha: 0.5)
        helperButton.setTitleColor(UIColor.black, for: .normal)
        organizationButton.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.5, blue: 0.5, alpha: 0.5)
        organizationButton.setTitleColor(UIColor.black, for: .normal)
        track = "Beneficiary"
        print("\(track)")
    }
    
    @IBAction func helperPressed(_ sender: UIButton) {
        beneficiaryButton.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.5, blue: 0.5, alpha: 0.5)
        beneficiaryButton.setTitleColor(UIColor.black, for: .normal)
        helperButton.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.5, blue: 0.5, alpha: 1.0)
        helperButton.setTitleColor(UIColor.white, for: .normal)
        organizationButton.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.5, blue: 0.5, alpha: 0.5)
        organizationButton.setTitleColor(UIColor.black, for: .normal)
        track = "Helper"
        print("\(track)")

    }
    
    @IBAction func organizationPressed(_ sender: UIButton) {
        beneficiaryButton.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.5, blue: 0.5, alpha: 0.5)
        beneficiaryButton.setTitleColor(UIColor.black, for: .normal)
        helperButton.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.5, blue: 0.5, alpha: 0.5)
        helperButton.setTitleColor(UIColor.black, for: .normal)
        organizationButton.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.5, blue: 0.5, alpha: 1.0)
        organizationButton.setTitleColor(UIColor.white, for: .normal)
        track = "Organization"
        print("\(track)")

    }
    
    
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
       if (userEmail.isEmpty || userPassword.isEmpty || userRepeatPassword.isEmpty) && track.isEmpty {
        // Alert message that all fields are required
        print("empty")
        msgAlert(title: "Alert!", text: "All fields are required. Including registering either as Beneficiary, Helper or Organization.")
        }
        if (userEmail.isEmpty || userPassword.isEmpty || userRepeatPassword.isEmpty) && track.isEmpty == false {
            // Alert message that all fields are required
            print("empty")
            msgAlert(title: "Alert!", text: "Email, password and repeat password fields are required.")
        }
        
        
       ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        
        
      ////// Check if password is == repeat password and alert text confirming successful registration //////////
        if (userPassword != userRepeatPassword) {
            msgAlert(title: "Warning!", text: "Password and repeat password are different. Type again.")
        } else if (track.isEmpty) && (userEmail.isEmpty == false || userPassword.isEmpty == false || userRepeatPassword.isEmpty == false) {
            msgAlert(title: "Warning", text: "You still need to register as either Beneficiary, Helper or Organization.")
        } else {
          msgConfirmation(title: "Confirmation", text: "You successfully registered")
            user_Login.append(LoginData(email: userEmail, password: userPassword, usertype: track ))
          
            
           for item in user_Login {
            if (store_Email.contains(item.email) == false) && (store_Password.contains(item.password) == false) && (store_Track.contains(item.usertype) == false){
                store_Email.append(item.email)
                store_Password.append(item.password)
                store_Track.append(item.usertype)
            }
           // print("\(item.email)")
          //  print("\(item.password)")
         //   print("\(item.usertype)")
            }
            
            
            
        } // end of else
        
       //////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        UserDefaults.standard.set(store_Email, forKey: "userEmail")
        UserDefaults.standard.set(store_Password, forKey: "userPassword")
        UserDefaults.standard.set(store_Track, forKey: "accountype")
        UserDefaults.standard.synchronize()
        
        // UserDefaults.standard.object(forKey: "userLogin")
        // Store data
     //   UserDefaults.standard.set(mutable_Login,forKey:"login")
       // UserDefaults.standard.synchronize()
       // let emailStored = UserDefaults.standard.string(forKey: userEmail)
      //  print(emailStored!)
        
        
    } // end of registerButton
    
    
    
    
    
    
    
    /////////////////////////////////// Function msgConfirmation generates confirmation text /////////////////////////////
    
    func msgConfirmation (title:String, text:String) {

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
