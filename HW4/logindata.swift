//
//  logindata.swift
//  HW4
//
//  Created by Sumeet Dhakan on 10/30/17.
//  Copyright © 2017 livia. All rights reserved.
//

import Foundation

class LoginData {
    // TODO: Define my LoginData class
    // Needs: properties for email, password and class initializer
    
    let email: String
    let password: String
    let usertype: String
    
    init(email: String, password:String, usertype: String) {
        self.email = email
        self.password = password
        self.usertype = usertype

    }
    
}
