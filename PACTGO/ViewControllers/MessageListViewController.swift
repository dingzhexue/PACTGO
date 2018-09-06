//
//  MessageListViewController.swift
//  PACTGO
//
//  Created by admin on 8/30/18.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit

class MessageListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tblMessageList: UITableView!
    var usersArray : Array = [["MessageName": "Dr.Cilinton","MessageAppointment": "Appointment Confirmation"],
                              ["MessageName": "Dr.Cilinton","MessageAppointment": "Appointment Confirmation"],
                              ["MessageName": "Dr.Cilinton","MessageAppointment": "Appointment Confirmation"],
                              ["MessageName": "Dr.Cilinton","MessageAppointment": "Appointment Confirmation"],
                              ["MessageName": "Dr.Cilinton","MessageAppointment": "Appointment Confirmation"],
                              ["MessageName": "Dr.Cilinton","MessageAppointment": "Appointment Confirmation"],
                              ["MessageName": "Dr.Cilinton","MessageAppointment": "Appointment Confirmation"],
                              ["MessageName": "Dr.Cilinton","MessageAppointment": "Appointment Confirmation"],
                              ["MessageName": "Dr.Cilinton","MessageAppointment": "Appointment Confirmation"],
                              ["MessageName": "Dr.Cilinton","MessageAppointment": "Appointment Confirmation"],
                              ["MessageName": "Dr.Cilinton","MessageAppointment": "Appointment Confirmation"],
                              ["MessageName": "Dr.Cilinton","MessageAppointment": "Appointment Confirmation"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        let nib = UINib.init(nibName: "MessageListTableViewCell", bundle: nil)
        self.tblMessageList.register(nib, forCellReuseIdentifier: "MessageListTableViewCell")
        // Do any additional setup after loading the view.
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initUI(){
        title = "Messages"
        let rightBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal),
                                       style: .plain,
                                       target: self,
                                       action: #selector(btnMenuTapped))
        let leftBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "back-arrow").withRenderingMode(.alwaysOriginal),
                                      style: .plain,
                                      target: self,
                                      action: #selector(btnBackTapped))
        navigationItem.titleView?.tintColor = UIColor.white
        navigationItem.rightBarButtonItem = rightBtn
        navigationItem.leftBarButtonItem = leftBtn
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    
    // MARK: - Navigation button actions
    @objc func btnMenuTapped(){
        sideMenuController?.revealMenu()
    }
    
    @objc func btnBackTapped(){
        navigationController?.popViewController(animated: true)
    }
}

extension MessageListViewController{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageListTableViewCell", for: indexPath) as! MessageListTableViewCell
        let dict = usersArray[indexPath.row]
        
        cell.messageName.text = dict["MessageName"]
        cell.messageAppointment.text = dict["MessageAppointment"]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "GoToMessageDetailViewController", sender: self)
    }
}

