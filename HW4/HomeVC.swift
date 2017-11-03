//
//  HomeVC.swift
//  HW4
//
//  Created by Sumeet Dhakan on 11/2/17.
//  Copyright © 2017 livia. All rights reserved.
//

import UIKit




class HomeVC: UIViewController {
  
    var current_User_Account:String = ""
    var current_User_Name:String = ""
    var current_User_Email:String = ""
    
    @IBOutlet weak var welcometext: UILabel!
    
    @IBAction func logoutpressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: false, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        welcometext.text = "Welcome \(current_User_Name) "
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
