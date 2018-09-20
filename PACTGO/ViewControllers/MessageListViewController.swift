//
//  MessageListViewController.swift
//  PACTGO
//
//  Created by admin on 8/30/18.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit

class MessageListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 24
    }
    
    
    @IBOutlet weak var messageListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        messageListTableView.delegate = self
        messageListTableView.dataSource = self
      
    }
    //MARK: MessageListTableView DataSource and Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "message_list_tableview_cell", for: indexPath) as! MessageListTableViewCell
        cell.setUpCell(index: indexPath.row)
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "GoToMessageDetailViewController", sender: self)
    }
}

