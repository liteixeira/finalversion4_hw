//
//  addServiceVC.swift
//  HW4
//
//  Created by Sumeet Dhakan on 11/6/17.
//  Copyright © 2017 livia. All rights reserved.
//

import UIKit

class addServiceVC: UIViewController {
    
    
    
    @IBOutlet weak var textField: UITextField!
    
    var user_Input = ""
    
    @IBAction func add_button_Pressed(_ sender: UIButton) {
        user_Input = textField.text!
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
