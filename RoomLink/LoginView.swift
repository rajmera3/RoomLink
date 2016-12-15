//
//  LoginView.swift
//  RoomLink
//
//  Created by Rahul Ajmera on 12/15/16.
//  Copyright © 2016 Rahul Ajmera. All rights reserved.
//

import Foundation
import UIKit

class LoginView: UIView{

    //Labels
    var emailUnderlineLabel = UILabel()
    var passUnderlineLabel = UILabel()
    
    //ImageViews
    var logoImg = UIImageView()
    
    //Buttons
    var loginBtn = UIButton()
    var signUpBtn = UIButton()
    var forgotPasswordButton = UIButton()
    
    
    //Text Fields
    var emailTF = UITextField()
    var passTF = UITextField()
    
    func configureImageViews(){
    logoImg.image = MWConstants.logo
    logoImg.contentMode = .scaleAspectFit
    }
    
    func configureTextFields(){
    }
    
    func configureLabels(){
    
    }

    func textFieldDidBeginEditing(_ textField : UITextField){
    }
    
    func configureButtons(){
    
    }
    
    func configureView(){
        configureImageViews()
        configureTextFields()
        configureLabels()
        configureButtons()
        textFieldDidBeginEditing(emailTF)
        
        //Auto Layout
        let viewsDict = [
            "title":logoImg,
            "emTF":emailTF,
            "passTF":passTF,
            "login":loginBtn,
            "signup":signUpBtn,
            "forgotPw":forgotPasswordButton,
            "elabel":emailUnderlineLabel,
            "plabel":passUnderlineLabel
        ] as [String:UIView]
        
        self.prepareViewsForAutoLayout(viewsDict)
    }









}
