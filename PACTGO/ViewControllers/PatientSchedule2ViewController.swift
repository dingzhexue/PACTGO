//
//  PatientSchedule2ViewController.swift
//  PACTGO
//
//  Created by admin on 8/31/18.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit

class PatientSchedule2ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
        
        title = "Schedule2"
        let leftBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "back-arrow").withRenderingMode(.alwaysOriginal),
                                      style: .plain,
                                      target: self,
                                      action: #selector(btnBackTapped))
        navigationItem.titleView?.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = leftBtn
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    
    // MARK: - Navigation button actions
    @objc func btnBackTapped(){
        navigationController?.popViewController(animated: true)
    }
    
}
