//
//  MainViewController.swift
//  PACTGO
//
//  Created by Admin on 5/29/18.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit
import SideMenuSwift
import AZTabBar

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerNotifications()
        initUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerNotifications(){
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "GoToAppointmentPage"),
                                               object: nil,
                                               queue: OperationQueue.main) { (notification) in
                                                self.performSegue(withIdentifier: "GoToAppointmentPage", sender: self)
                                                self.sideMenuController?.hideMenu()
        }
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "GoToYourAccountPage"),
                                               object: nil,
                                               queue: OperationQueue.main) { (notification) in
                                                self.initTabBarController()
                                                self.sideMenuController?.hideMenu()
        }
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "GoToHelpPage"),
                                               object: nil,
                                               queue: OperationQueue.main) { (notification) in
                                                self.performSegue(withIdentifier: "GoToHelpPage", sender: self)
                                                self.sideMenuController?.hideMenu()
        }
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "GoToInboxPage"),
                                               object: nil,
                                               queue: OperationQueue.main) { (notification) in
                                                self.performSegue(withIdentifier: "GoToInboxPage", sender: self)
                                                self.sideMenuController?.hideMenu()
        }
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "GoToSignInPage"),
                                               object: nil,
                                               queue: OperationQueue.main) { (notification) in
                                                self.performSegue(withIdentifier: "GoToSignInPage", sender: self)
                                                self.sideMenuController?.hideMenu()
        }
    }
    
    func initUI(){
        let navBar = self.navigationController?.navigationBar
        navBar?.setBackgroundImage(#imageLiteral(resourceName: "topbar"), for: .default)
        navBar?.shadowImage = UIImage()
        navBar?.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        let imageView = UIImageView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: 40,
                                                  height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "logo").withRenderingMode(.alwaysOriginal)
        navigationItem.titleView = imageView
        
        let rightBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal),
                                       style: .plain,
                                       target: self,
                                       action: #selector(btnMenuTapped))
        let leftBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "homelogo").withRenderingMode(.alwaysOriginal),
                                      style: .plain,
                                      target: self,
                                      action: #selector(btnLogoTapped))
        navigationItem.rightBarButtonItem = rightBtn
        navigationItem.leftBarButtonItem = leftBtn
    }
    
    // MARK: - Memeber functions
    func initTabBarController(){
        navigationController?.navigationBar.isHidden = true
        var icons = [String]()
        icons.append("icon-account")
        icons.append("icon-schedule")
        icons.append("icon-history")
        let tabController = AZTabBarController.insert(into: self, withTabIconNames: icons)
        let chlidVC0 = storyboard?.instantiateViewController(withIdentifier: "YourAccountNavigationViewController")
        let chlidVC1 = storyboard?.instantiateViewController(withIdentifier: "PatientScheduleNavigationViewController")
        let chlidVC2 = storyboard?.instantiateViewController(withIdentifier: "HistoryNavigationViewController")
        tabController.setViewController(chlidVC0!, atIndex: 0)
        tabController.setViewController(chlidVC1!, atIndex: 1)
        tabController.setViewController(chlidVC2!, atIndex: 2)
        tabController.setTitle("Account", atIndex: 0)
        tabController.setTitle("Schedule", atIndex: 1)
        tabController.setTitle("History", atIndex: 2)
        
        tabController.defaultColor = .gray
        tabController.buttonsBackgroundColor = .white
        tabController.selectionIndicatorColor = UIColor.init(red: 51 / 255,
                                                              green: 192 / 255,
                                                              blue: 174 / 255,
                                                              alpha: 1.0)
        tabController.animateTabChange = true
        
        navigationController?.pushViewController(tabController, animated: true)
    }

    
    // MARK: - Navigation button actions
    @objc func btnMenuTapped(){
        sideMenuController?.revealMenu()
    }
    
    @objc func btnLogoTapped(){
        
    }
    
    // MARK: - UIbutton actions
    @IBAction func btnBookAppointmentTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "GoToAppointmentPage", sender: self)
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
