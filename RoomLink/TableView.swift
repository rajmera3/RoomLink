//
//  TableView.swift
//  RoomLink
//
//  Created by Rahul Ajmera on 12/6/16.
//  Copyright © 2016 Rahul Ajmera. All rights reserved.
//

import Foundation
import UIKit

class TableView: UIView{

    var tasksTable = UITableView()

    
    
    
    func configureView(){
        
//        let gradient = CAGradientLayer()
//        gradient.frame = self.bounds
//        gradient.colors = [MWConstants.colors.loginDarkGradient.cgColor, MWConstants.colors.loginLightGradient.cgColor]
//        self.layer.insertSublayer(gradient, at: 0)
        
        let viewsDict = [
            "tableView":tasksTable
            ] as [String : UIView]
        
        self.prepareViewsForAutoLayout(viewsDict)
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|[tableView]|", views: viewsDict))
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|[tableView]|", views: viewsDict))
        
        
        
        
        
        
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
}
