//
//  PatientSchedule2ViewController.swift
//  PACTGO
//
//  Created by admin on 8/31/18.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit

class PatientSchedule2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var PatientScheduleView: UITableView!
    
    var scheduleArray : Array = [["Schedule" : "8:00 am Appointment", "Schedule" : "9:00 am Appointment", "Schedule" : "10:00 am Appointment", "Address": "HongKong"]]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scheduleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatientScheduleTableViewCell", for: indexPath) as! PatientScheduleTableViewCell
        let dict = scheduleArray[indexPath.row]
        
        cell.therapyApp.text = dict["Schedule"]
        cell.checkBtn.setImage(UIImage(named: "checkline-logo"), for: .normal)
        cell.addRess.text = dict["Address"]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "PatientSchedule", bundle: nil)
        self.PatientScheduleView.register(nib, forCellReuseIdentifier: "PatientSchedule")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
