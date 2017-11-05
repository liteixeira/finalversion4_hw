//
//  MyProfileVC.swift
//  HW4
//
//  Created by Sumeet Dhakan on 11/3/17.
//  Copyright © 2017 livia. All rights reserved.
//

import UIKit



class MyProfileVC: UIViewController, Send_Data_Myprofile {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    @IBOutlet weak var label10: UILabel!
    @IBOutlet weak var label11: UILabel!
    @IBOutlet weak var label12: UILabel!
    @IBOutlet weak var label13: UILabel!
    @IBOutlet weak var label14: UILabel!
    @IBOutlet weak var label15: UILabel!
    @IBOutlet weak var label16: UILabel!
    
    
    var current_User_Account:String = ""
    var current_User_Name:String = ""
    var current_User_Email:String = ""
    
   
  
    
    @IBAction func editbuttonPressed(_ sender: UIBarButtonItem) {
        
        switch current_User_Account {
        case "Beneficiary":
             self.performSegue(withIdentifier: "myprofiletobeneficiary", sender: self)
        case "Helper":
              self.performSegue(withIdentifier: "myprofiletohelper", sender: self)
        case "Organization":
              self.performSegue(withIdentifier: "myprofiletoorganization", sender: self)
        default:
            print("Error! Check the code!")
        }
        
    }
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textData(data: String) {
       label1.text = data
        
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "myprofiletobeneficiary" {
            
            let destVC: BeneficiaryRegistrationVC = segue.destination as! BeneficiaryRegistrationVC
            destVC.delegate = self
        }
        
    }
 

}
