//
//  MyProfileVC.swift
//  HW4
//
//  Created by Sumeet Dhakan on 11/3/17.
//  Copyright © 2017 livia. All rights reserved.
//

import UIKit

var data_Benefiiary_Send = ["","","","","","","",""]

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
    
        
        switch current_User_Account {
        case "Beneficiary":
            label.text = "Full name:"
            label2.text = "Type of Disability:"
            label4.text = "Address (Streeet):"
            label6.text = "ZIP/Postal Code:"
            label8.text = "City"
            label10.text = "Country"
            label12.text = "Contact Information:"
            label13.text = "Personal:"
            label15.text = "Emergency:"
            
            label1.text = data_Benefiiary_Send[0]
            label3.text = data_Benefiiary_Send[1]
            label5.text = data_Benefiiary_Send[2]
            label7.text = data_Benefiiary_Send[3]
            label9.text = data_Benefiiary_Send[4]
            label11.text = data_Benefiiary_Send[5]
            label14.text = data_Benefiiary_Send[6]
            label16.text = data_Benefiiary_Send[7]
            
            if  data_Benefiiary_Send[0] == "" && data_Benefiiary_Send[2] == "" && data_Benefiiary_Send[3] == "" &&
            data_Benefiiary_Send[4] == "" && data_Benefiiary_Send[5] == "" && data_Benefiiary_Send[6] == "" &&
            data_Benefiiary_Send[7] == "" {
                
                self.msgConfirmation(title: "Message", text: "Go to Edit to update your profile")
            }
            
            print("\(data_Benefiiary_Send)")
            
            
        default:
            print("Error! Check the code")
        }
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textData(data: [String]) {
       label1.text = data[0]
       label3.text = data[1]
       label5.text = data[2]
       label7.text = data[3]
       label9.text = data[4]
       label11.text = data[5]
       label14.text = data[6]
       label16.text = data[7]
   
        data_Benefiiary_Send = data
        print("\(data_Benefiiary_Send)")
        
        
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
 
    func msgConfirmation (title:String, text:String) {
        
        let confirmation = UIAlertController.init(title: title, message: text, preferredStyle: .alert)
        let confirmationAction = UIAlertAction.init(title: "OK", style: .default) { (action) in
            confirmation.dismiss(animated: true, completion: nil)
            //  self.navigationController?.popViewController(animated: true)
        }
        confirmation.addAction(confirmationAction)
        present(confirmation, animated: true, completion: nil)
    }
    
    
    
}
