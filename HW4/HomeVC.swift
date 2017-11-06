//
//  HomeVC.swift
//  HW4
//
//  Created by Sumeet Dhakan on 11/2/17.
//  Copyright © 2017 livia. All rights reserved.
//

import UIKit

var temp_current_User:String = ""
var temp_current_Email:String = ""

class HomeVC: UIViewController {
  
    var current_User_Account:String = ""
    var current_User_Name:String = ""
    var current_User_Email:String = ""
    var index_user = ""
    
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var welcometext: UILabel!


    @IBAction func logoutpressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        welcometext.text = "Welcome \(current_User_Name) "
        
        switch current_User_Account {
        case "Beneficiary":
            button1.setTitle("Warning Center", for: .normal)
            button2.setTitle("My Profile", for: .normal)
            button3.setTitle("Service Monitoring", for: .normal)
            button4.setTitle("Organizations", for: .normal)
        case "Helper":
            
            button1.setTitle("Warning Center", for: .normal)
            button2.setTitle("My Profile", for: .normal)
            button3.setTitle("Service Monitoring", for: .normal)
            button4.removeFromSuperview()
            
        case "Organization":
            button1.setTitle("Warning Center", for: .normal)
            button2.setTitle("My Profile", for: .normal)
            button3.setTitle("Service Monitoring", for: .normal)
            button4.removeFromSuperview()
            
        default:
            print("Error! Check the code!!")
        }
        
        temp_current_User  = current_User_Account
        temp_current_Email = current_User_Email
        
        
    }
    
    @IBAction func button2_Pressed(_ sender: UIButton) {
        switch current_User_Account {
        case "Beneficiary":
            self.performSegue(withIdentifier: "hometoprofile", sender: self )
        case "Organization":
            self.performSegue(withIdentifier: "hometoorgrg", sender: self)
        default:
            print("Error")
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        //needs to send data to my profile -> know type of account and in my profile select the correct sague to show
        // != View controllers
        if segue.identifier == "hometomyprofile" {
         let destVC = segue.destination as! MyProfileVC
        // let firstdestVC = navVC.viewControllers[0] as! HomeVC
        // let destVC = navVC.viewControllers[1] as! MyProfileVC
            
            destVC.current_User_Account = temp_current_User
            destVC.current_User_Email = temp_current_Email
            destVC.current_User_index = index_user
            print("Opa!")
            print("\(destVC.current_User_Account)")
            print("\(destVC.current_User_Email)")
            
            
        }
       
        
        
    }
 

}
