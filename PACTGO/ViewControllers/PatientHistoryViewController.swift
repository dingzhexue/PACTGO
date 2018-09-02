//
//  PatientHistoryViewController.swift
//  PACTGO
//
//  Created by admin on 8/30/18.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit

class PatientHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tblPatientHistory: UITableView!
    var painsArray : Array = [["Pain" : "Shoulder Pain","Pain" : "Knee Pain"]]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return painsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatientHistoryCell", for: indexPath) as! PatientHistoryTableViewCell
        let dict = painsArray[indexPath.row]
        
        cell.PainHistoryCell.text = dict["Pain"]
        cell.PainHistoryBtn.setImage(UIImage(named: "downarrow-logo"), for: .normal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "PatientHistoryCell", bundle: nil)
        self.tblPatientHistory.register(nib, forCellReuseIdentifier: "PatientHistoryCell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
