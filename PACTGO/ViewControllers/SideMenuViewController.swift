//
//  SideMenuViewController.swift
//  PACTGO
//
//  Created by Admin on 5/26/18.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit

class SideMenuViewController: UITableViewController {
    
    let viewTitles = ["Appointment", "My Account", "Help", "Inbox", "Logout"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier")
        if cell == nil {
            cell = UITableViewCell()
        }
        cell?.textLabel?.text = viewTitles[indexPath.row]
        cell?.textLabel?.font = UIFont(name: "Muli", size: 17)
        return cell!
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return viewTitles.count
    }

    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "GoToAppointmentPage"),
                                            object: nil)
            break
        case 1:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "GoToYourAccountPage"),
                                            object: nil)
            break
        case 2:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "GoToHelpPage"),
                                            object: nil)
            break
        case 3:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "GoToInboxPage"),
                                            object: nil)
            break
        case 4:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "GoToInitPage"),
                                            object: nil)
            break
        default:
            break
        }
    }
}

