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
    var historyArray : Array = [["DateTime" : "Jan 8:00am", "DateTime" : "Jan 8:00am", "DateTime" : "Jan 8:00am"]]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatientHistoryList2TableViewCell", for: indexPath) as! PatientHistoryList2TableViewCell
        let dict = historyArray[indexPath.row]
        
        cell.timeField.text = dict["DateTime"]
        cell.clickBtn.setImage(UIImage(named: "checked-logo"), for: .normal)
        
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
