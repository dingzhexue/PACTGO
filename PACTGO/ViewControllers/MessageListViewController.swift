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
    var usersArray : Array = [["MessageName": "Dr.Cilinton","MessageAppointment": "Appointment"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "MessageListViewCell", bundle: nil)
        self.tblMessageList.register(nib, forCellReuseIdentifier: "MessageListViewCell")
        // Do any additional setup after loading the view.
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageListViewCell", for: indexPath) as! MessageListItemTableViewCell
        let dict = usersArray[indexPath.row]
        
        cell.MessageName.text = dict["MessageName"]
        cell.MessageAppointment.text = dict["MessageAppointment"]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.count
    }
    
}

