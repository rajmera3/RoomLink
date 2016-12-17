//
//  LoginViewController.swift
//  RoomLink
//
//  Created by Rahul Ajmera on 12/15/16.
//  Copyright © 2016 Rahul Ajmera. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class LoginViewController: UIViewController, UITextFieldDelegate{
    
    var loginView = LoginView(frame:CGRect(x: 0, y: 0, width: MWConstants.screenWidth, height: MWConstants.screenHeight))
    
    
    func configureView(){
        //configureButtons()
        self.view.addSubview(loginView)
    }
    
    override func viewDidLoad() {
        configureView()
        self.dismissKeyboardAtTap()
        self.loginView.emailTF.delegate = self
        self.loginView.passTF.delegate = self
    
    }
    
    






}
