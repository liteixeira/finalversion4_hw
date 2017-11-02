//
//  ViewController.swift
//  HW4
//
//  Created by Sumeet Dhakan on 10/23/17.
//  Copyright © 2017 livia. All rights reserved.
//

import UIKit

class LoginVC : UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textuserName: UITextField!
    
    @IBOutlet weak var textPassword: UITextField!
    
    @IBAction func loginPressed(_ sender: UIButton) {
        let useremailLogIn = textuserName.text!
        let userpasswordLogIn = textPassword.text!
        let email_Data_Stored = UserDefaults.standard.stringArray(forKey: "userEmail")
       // let email_Data_Stored = UserDefaults.standard.string(forKey: "userEmail")
     //   let password_Data_Stored = UserDefaults.standard.string(forKey: "userPassword")
        for (index,item) in email_Data_Stored!.enumerated() {
            if (useremailLogIn == email_Data_Stored![index]) {
                // User can Log in
                print("Log in can be done")
             //   UserDefaults.standard.bool(forKey: "userabletoLogIn")
              //  UserDefaults.standard.synchronize()
                  self.performSegue(withIdentifier: "logintohome", sender:self)
            }
        }
        //if (useremailLogIn == email_Data_Stored) && (userpasswordLogIn == password_Data_Stored) {
            // User can Log in
          //  print("Log in can be done")
         //   UserDefaults.standard.bool(forKey: "userabletoLogIn")
       //     UserDefaults.standard.synchronize()
     //   }
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  // Hide keyboard when user touches outside the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    //override func viewDidAppear(_ animated: Bool) {
       // let userLogInConfirmation = UserDefaults.standard.bool(forKey: "userabletoLogIn")
       // if(!userLogInConfirmation) {
      //      self.performSegue(withIdentifier: "logintohome", sender:self)
    //    }
  //  }

}

