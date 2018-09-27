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
    var painsArray = ["Back Pain", "Neck Pain", "Shoulder Pain","Arm Pain", "Hip Pain", "Knee Pain", "Ankle Pain", "Lower Back pain", "Chest Pain"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblPatientHistory.dataSource = self
        tblPatientHistory.delegate = self
        
        initUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initUI(){
        let navBar = self.navigationController?.navigationBar
        navBar?.setBackgroundImage(#imageLiteral(resourceName: "topbar"), for: .default)
        navBar?.shadowImage = UIImage()
        navBar?.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        title = "Patient\nHistory List"
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        titleLabel.numberOfLines = 2
        titleLabel.text = title
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "Muli-SemiBold", size: 14)
        navigationItem.titleView = titleLabel
        
//        let leftBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "back-arrow").withRenderingMode(.alwaysOriginal),
//                                      style: .plain,
//                                      target: self,
//                                      action: #selector(btnBackTapped))
        navigationItem.titleView?.tintColor = UIColor.white
//        navigationItem.leftBarButtonItem = leftBtn
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: "Muli-SemiBold", size: 17)!,
                                                                   NSAttributedStringKey.foregroundColor: UIColor.white]
        
    }
    
    // MARK: - Navigation button actions
//    @objc func btnBackTapped(){
//        navigationController?.popViewController(animated: true)
//    }

    // MARK: Datasource and Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return painsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "history_pain_cell", for: indexPath) as! PatientHistoryTableViewCell
        let dict = painsArray[indexPath.row]
        cell.painLabel.text = dict
        if indexPath.row % 4 == 0 {
            cell.arrowImage.isHidden = false
        } else {
            cell.arrowImage.isHidden = true
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row % 4 == 0 {
            self.performSegue(withIdentifier: "show_patient_history_detail", sender: self)
        }
    }

}
