//
//  ViewController.swift
//  HW4
//
//  Created by Sumeet Dhakan on 10/23/17.
//  Copyright © 2017 livia. All rights reserved.
//

import UIKit

var temp:Bool = false
var count:Int = 0

class LoginVC : UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textuserName: UITextField!
    
    @IBOutlet weak var textPassword: UITextField!
    
    @IBAction func loginPressed(_ sender: UIButton) {
        let useremailLogIn = textuserName.text!
        let userpasswordLogIn = textPassword.text!
        let email_Data_Stored = UserDefaults.standard.stringArray(forKey: "userEmail")
        let password_Data_Stored = UserDefaults.standard.stringArray(forKey: "userPassword")
        let account_type_Data_Stored = UserDefaults.standard.string(forKey: "accountype")
      
       
        for (index,item) in email_Data_Stored!.enumerated() {
            if (useremailLogIn == email_Data_Stored![index]) {
                // User can Log in
                print("User email correct")
          
                temp = true
                count = index
            } // end if
        } // end email_Data_Stored for loop
        print("\(password_Data_Stored![count])")
        print("\(userpasswordLogIn)")
        
        if (temp == true) && (userpasswordLogIn == password_Data_Stored![count]){
           print("Log in can be done")
           self.performSegue(withIdentifier: "logintohome", sender: self)
          temp = false
          textuserName.delegate = self
          textPassword.delegate = self
        } // end if
        
        
        
    } // end login pressed func
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        textuserName!.text = ""
        textPassword!.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  // Hide keyboard when user touches outside the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
      //  shouldPerformSegue(withIdentifier: "logintohome", sender: self)
        // pass track to home view controller
     //   let destVC = segue.destination as! HomeVC
        if segue.identifier == "logintohome" {
            print("Yeah")
        }
        
      //  destVC.current_User_Type = account_type_Data_Stored
        
    }
    

}

