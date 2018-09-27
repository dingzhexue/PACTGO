//
//  SelectTimeViewController.swift
//  PACTGO
//
//  Created by 123 on 2018/09/19.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit

class SelectTimeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var timeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timeTableView.delegate = self
        timeTableView.dataSource = self
        initUI()
    }
    
    
    func initUI(){
        title = "Select Time"
        let rightBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal),
                                       style: .plain,
                                       target: self,
                                       action: #selector(btnMenuTapped))
        let leftBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "back-arrow").withRenderingMode(.alwaysOriginal),
                                      style: .plain,
                                      target: self,
                                      action: #selector(btnBackTapped))
        navigationItem.titleView?.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = leftBtn
        navigationItem.rightBarButtonItem = rightBtn
        navigationItem.rightBarButtonItem?.tintColor = UIColor.init(red: 51 / 255,
                                                                    green: 192 / 255,
                                                                    blue: 174 / 255,
                                                                    alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: "Muli-SemiBold", size: 17)!,
                                                                   NSAttributedStringKey.foregroundColor: UIColor.white]
        
    }
    
    // MARK: - Navigation button actions
    @objc func btnMenuTapped(){
        sideMenuController?.revealMenu()
    }
    
    @objc func btnBackTapped(){
        navigationController?.popViewController(animated: true)
    }
}

extension SelectTimeViewController {
    // MARK: TimeTableView Datasource and Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 14
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "select_time_cell", for: indexPath) as! SelectTimeTableViewCell
        cell.setUpCell(index: indexPath.row)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "GoToPatient2ViewController", sender: self)
    }
}
