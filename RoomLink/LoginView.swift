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
    //logoImg.image = MWConstants.logo
    //logoImg.contentMode = .scaleAspectFit
    }
    
    func configureTextFields(){
        
        // Setting text field item properties
        emailTF.layer.cornerRadius = 10.0
        //emailTF.layer.borderWidth = 1
        
        passTF.layer.cornerRadius = 10.0
        //passwordTF.layer.borderWidth = 1
        
        // Setting text properties
        emailTF.keyboardType = UIKeyboardType.emailAddress
        emailTF.returnKeyType = UIReturnKeyType.next
        emailTF.attributedPlaceholder = NSAttributedString(string: "Enter Email", attributes: [NSForegroundColorAttributeName: UIColor.lightText])
        emailTF.font = UIFont(name: "Avenir-Medium", size: 15.0)
        emailTF.textColor = UIColor.white
        
        passTF.returnKeyType = UIReturnKeyType.done
        passTF.attributedPlaceholder = NSAttributedString(string: "Enter Password", attributes: [NSForegroundColorAttributeName: UIColor.lightText])
        passTF.font = UIFont(name: "Avenir-Medium", size: 15.0)
        passTF.textColor = UIColor.white
        passTF.isSecureTextEntry = true
        
        
    }
    
    func configureLabels(){
        emailUnderlineLabel.textColor = UIColor.white
        passUnderlineLabel.textColor = UIColor.white
        
        emailUnderlineLabel.text = emailUnderlineLabel.setUnderline()
        passUnderlineLabel.text = passUnderlineLabel.setUnderline()
        
        emailUnderlineLabel.textColor = UIColor(r: 46, g: 204, b: 113, a: 1.0)
        passUnderlineLabel.textColor = UIColor(r: 46, g: 204, b: 113, a: 1.0)
        
    }

    func textFieldDidBeginEditing(_ textField : UITextField){
    }
    
    func configureButtons(){
        loginBtn.layer.borderWidth = 1
        loginBtn.layer.cornerRadius = 20.0
        loginBtn.layer.borderColor = UIColor(r: 46, g: 204, b: 113, a: 1.0).cgColor
        loginBtn.setTitle("Login", for: UIControlState())
        loginBtn.setTitleColor(UIColor.lightText, for: UIControlState())
    }
    
    func configureView(){
        
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [MWConstants.colors.loginDarkGradient.cgColor, MWConstants.colors.loginLightGradient.cgColor]
        self.layer.insertSublayer(gradient, at: 0)
        
    
        configureImageViews()
        configureTextFields()
        configureLabels()
        configureButtons()
        textFieldDidBeginEditing(emailTF)
        
        //Auto Layout
        let viewsDict = [
            "emTF":emailTF,
            "passTF":passTF,
            "login":loginBtn,
            "signup":signUpBtn,
            "forgotPw":forgotPasswordButton,
            "elabel":emailUnderlineLabel,
            "plabel":passUnderlineLabel
        ] as [String:UIView]
        
        self.prepareViewsForAutoLayout(viewsDict)
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-400-[emTF]-1-[elabel]-15-[passTF]-1-[plabel]-40-[login]-10-[forgotPw]-70-[signup]-10-|", views: viewsDict))
        //
        //self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|[title]|", views: viewsDict))
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(describing: MWConstants.loginFieldsOffset))-[emTF]-\(String(describing: MWConstants.loginFieldsOffset))-|", views: viewsDict as [String : AnyObject]))
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(describing: MWConstants.loginFieldsOffset))-[elabel]-\(String(describing: MWConstants.loginFieldsOffset))-|", views: viewsDict as [String : AnyObject]))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(describing: MWConstants.loginFieldsOffset))-[plabel]-\(String(describing: MWConstants.loginFieldsOffset))-|", views: viewsDict as [String : AnyObject]))
        
        
        
        //         self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-30-[title]-30-|", views: viewsDict as [String : AnyObject]))
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(describing: MWConstants.loginFieldsOffset))-[passTF]-\(String(describing: MWConstants.loginFieldsOffset))-|", views: viewsDict as [String : AnyObject]))
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(describing: MWConstants.loginFieldsOffset))-[login]-\(String(describing: MWConstants.loginFieldsOffset))-|", views: viewsDict as [String : AnyObject]))
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(describing: MWConstants.loginFieldsOffset))-[signup]-\(String(describing: MWConstants.loginFieldsOffset))-|", views: viewsDict as [String : AnyObject]))
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(describing: MWConstants.loginFieldsOffset))-[forgotPw]-\(String(describing: MWConstants.loginFieldsOffset))-|", views: viewsDict as [String : AnyObject]))
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
