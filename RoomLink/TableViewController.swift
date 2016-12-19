//
//  TableViewController.swift
//  RoomLink
//
//  Created by Rahul Ajmera on 12/6/16.
//  Copyright © 2016 Rahul Ajmera. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // Subview Instantiation
    var tableView = TableView(frame: CGRect(x: 0, y: 60, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 60))
    var navBar: UINavigationBar = UINavigationBar(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60))
    
    
    var lists: Results<TaskList>!
    var realm: Realm!
    
    func configureView(){
        self.view.addSubview(tableView)
        self.view.addSubview(navBar)
    }
    
    func readTasksandUpdateUI(){
        lists = uiRealm.objects(TaskList.self)
        self.tableView.tasksTable.setEditing(false, animated: true)
        self.tableView.tasksTable.reloadData()
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
            return UIStatusBarStyle.lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        readTasksandUpdateUI()
    }
    
    
    override func viewDidLoad() {
        configureView()
        tableView.tasksTable.delegate = self
        tableView.tasksTable.dataSource = self
        tableView.tasksTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        //Configure Nav Bar
        let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(displayAlertToAdd))
        let navItem = UINavigationItem(title: "Shared List")
        navItem.rightBarButtonItem = addButton
        navBar.items = [navItem]
        navBar.titleTextAttributes = [NSFontAttributeName: UIFont(name:"Avenir-Medium", size: 20.0)!]
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navBar.barTintColor = UIColor.init(r: 44 , g: 62, b: 80, a: 1.0)
    }
    
    func tableView(_:UITableView, numberOfRowsInSection section: Int)-> Int {
        if let listTasks = lists{
            return listTasks.count
        }
        return 0
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        let list = lists?[indexPath.row]
        cell.textLabel?.text = list?.name
        return cell
    }
    
    func displayAlertToAdd(){
        
        //CURRENTLY ADDING NEW ****TASKLIST****. CREATE BUTTON FOR ROW TO GET NESTED TASKS IN EACH TASKLIST
        let alertController = UIAlertController(title: "New Item", message:"Add an Item or Task to the List", preferredStyle: UIAlertControllerStyle.alert)
        let add = UIAlertAction(title: "Add To List", style: UIAlertActionStyle.default) {(_) in
            let alertTextField = alertController.textFields?.first
            
            let newTaskList = TaskList() //<------- CHANGE THIS TO MAKE TASK. ALSO CHANGE LISTS GLOBAL VAR IN FUNC(CELLFORROWAT)
            newTaskList.name = alertTextField!.text!
            try! uiRealm.write{
                uiRealm.add(newTaskList)
                self.readTasksandUpdateUI()
                print("k")
            }
    }
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel)
        
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(add)
        alertController.addAction(cancel)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.destructive, title: "Delete") {(_) in
            let listToBeDeleted = self.lists[indexPath.row]
            try! uiRealm.write {
                uiRealm.delete(listToBeDeleted)
                self.readTasksandUpdateUI()
            }
        }
        return [deleteAction]
    }
}
