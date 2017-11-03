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
var account_type_Data_Stored = [String]()
var email_Data_Stored = [String]()
var password_Data_Stored = [String]()

class LoginVC : UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textuserName: UITextField!
    
    @IBOutlet weak var textPassword: UITextField!
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        let useremailLogIn = textuserName.text!
        let userpasswordLogIn = textPassword.text!
        
        email_Data_Stored = UserDefaults.standard.stringArray(forKey: "userEmail")!
        password_Data_Stored = UserDefaults.standard.stringArray(forKey: "userPassword")!
        account_type_Data_Stored = UserDefaults.standard.stringArray(forKey: "accountype")!
      
       
        for (index,item) in email_Data_Stored.enumerated() {
            if (useremailLogIn == email_Data_Stored[index]) {
                // User can Log in
                print("User email correct")
          
                temp = true
                count = index
            } // end if
        } // end email_Data_Stored for loop
        
       // print("\(password_Data_Stored![count])")
      //  print("\(userpasswordLogIn)")
      //  print("\(account_type_Data_Stored[count])")
        
        if (temp == true) && (userpasswordLogIn == password_Data_Stored[count]){
          print("Log in can be done")
          self.performSegue(withIdentifier: "logintohome", sender: self)
          temp = false
          self.textuserName.text = ""
          self.textPassword.text = ""
            
        } // end if
        
        
    } // end login pressed func
    
    
    
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
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
       if segue.identifier == "logintohome" {
            print("Yeah")
            let navVC = segue.destination as! UINavigationController
            let destVC = navVC.topViewController as! HomeVC

            destVC.current_User_Account = account_type_Data_Stored[count]
            destVC.current_User_Email = email_Data_Stored[count]
            
        
          //  print("\(destVC.current_User_Account)")
         //   print("\(destVC.current_User_Name)")
            

        }
        
      //  destVC.current_User_Type = account_type_Data_Stored
        
    }
    

}

