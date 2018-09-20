//
//  PatientHistoryList2ViewController.swift
//  PACTGO
//
//  Created by admin on 8/30/18.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit

class PatientHistoryList2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var PatientHistoryListView: UITableView!
    
    var monthArray = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        PatientHistoryListView.dataSource = self
        PatientHistoryListView.delegate = self
    }

    
    // MARK: Datasource and Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 32
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "history_month_header_cell") as! PatientHistoryMonthHeaderTableViewCell
        cell.monthLabel.text = monthArray[section]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatientHistoryList2TableViewCell", for: indexPath) as! PatientHistoryList2TableViewCell
        if indexPath.section == 0 {
            cell.clickBtn.isHidden = false
            if indexPath.row % 4 == 1 {
                cell.clickBtn.image = #imageLiteral(resourceName: "circle-uncheckmark")
            } else {
                cell.clickBtn.image = #imageLiteral(resourceName: "circle-checkmark")
            }
            cell.timeField.text = "Jan 03 8-10 am"
        } else {
            cell.timeField.text = "Add an appointment..."
            cell.clickBtn.isHidden = true
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
