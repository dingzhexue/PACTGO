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

class MainViewController: UIViewController, AZTabBarDelegate {
    
//    var window: UIWindow!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerNotifications()        
//        let menuVC = self.storyboard?.instantiateViewController(withIdentifier: "SideMenuViewController")
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.rootViewController = SideMenuController(contentViewController: self,
//                                                        menuViewController: menuVC!)
//        SideMenuController.preferences.basic.menuWidth = 240
//        SideMenuController.preferences.basic.statusBarBehavior = .fade
//        SideMenuController.preferences.basic.direction = .right
//        SideMenuController.preferences.basic.enablePanGesture = true
//        SideMenuController.preferences.basic.supportedOrientations = .portrait
//
//        window?.makeKeyAndVisible()
        
        initUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerNotifications(){
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "GoToAppointmentPage"),
                                               object: nil,
                                               queue: OperationQueue.main) { (notification) in
                                                self.navigationController?.popViewController(animated: false)
                                                self.performSegue(withIdentifier: "GoToAppointmentPage", sender: self)
                                                self.sideMenuController?.hideMenu()
        }
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "GoToYourAccountPage"),
                                               object: nil,
                                               queue: OperationQueue.main) { (notification) in
                                                self.navigationController?.popViewController(animated: false)
                                                self.initTabBarController()
                                                self.sideMenuController?.hideMenu()
        }
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "GoToHelpPage"),
                                               object: nil,
                                               queue: OperationQueue.main) { (notification) in
                                                self.navigationController?.popViewController(animated: false)
                                                self.performSegue(withIdentifier: "GoToHelpPage", sender: self)
                                                self.sideMenuController?.hideMenu()
        }
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "GoToInboxPage"),
                                               object: nil,
                                               queue: OperationQueue.main) { (notification) in
                                                self.navigationController?.popViewController(animated: false)
                                                self.performSegue(withIdentifier: "GoToInboxPage", sender: self)
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
                                                  width: 30,
                                                  height: 30))
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "logo-head").withRenderingMode(.alwaysOriginal)
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
        var icons = [String]()
        icons.append("icon-account")
        icons.append("icon-schedule")
        icons.append("icon-history")
        appDelegate.tabController = AZTabBarController.insert(into: self, withTabIconNames: icons)
        let chlidVC0 = storyboard?.instantiateViewController(withIdentifier: "YourAccountNavigationViewController")
        let chlidVC1 = storyboard?.instantiateViewController(withIdentifier: "PatientScheduleNavigationViewController")
//        let chlidVC2 = storyboard?.instantiateViewController(withIdentifier: "HistoryNavigationViewController")
        let chlidVC2 = storyboard?.instantiateViewController(withIdentifier: "HistoryDetailNavigationViewController")
        
        appDelegate.tabController?.setViewController(chlidVC0!, atIndex: 0)
        appDelegate.tabController?.setViewController(chlidVC1!, atIndex: 1)
        appDelegate.tabController?.setViewController(chlidVC2!, atIndex: 2)
        appDelegate.tabController?.setTitle("Account", atIndex: 0)
        appDelegate.tabController?.setTitle("Schedule", atIndex: 1)
        appDelegate.tabController?.setTitle("History", atIndex: 2)
        appDelegate.tabController?.defaultColor = .gray
        appDelegate.tabController?.selectedColor = UIColor.init(red: 51 / 255,
                                                   green: 192 / 255,
                                                   blue: 174 / 255,
                                                   alpha: 1.0)
        appDelegate.tabController?.buttonsBackgroundColor = UIColor.init(red: 215 / 255,
                                                                         green: 215 / 255,
                                                                         blue: 215 / 255,
                                                                         alpha: 1.0)
        appDelegate.tabController?.selectionIndicatorHeight = 0
        appDelegate.tabController?.animateTabChange = false
        appDelegate.tabController?.tabBarHeight = 70
        appDelegate.tabController?.delegate = self
        navigationController?.navigationBar.isHidden = true
        navigationController?.pushViewController(appDelegate.tabController!, animated: true)
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

extension MainViewController{
    // MARK: - AZTabBarDelegate
    func tabBar(_ tabBar: AZTabBarController, didSelectTabAtIndex index: Int) {
        switch index {
        case 0:
            appDelegate.tabController?.buttonsBackgroundColor = UIColor.init(red: 215 / 255,
                                                                             green: 215 / 255,
                                                                             blue: 215 / 255,
                                                                             alpha: 1.0)
            break
        case 1:
            appDelegate.tabController?.buttonsBackgroundColor = UIColor.init(red: 54 / 255,
                                                                             green: 54 / 255,
                                                                             blue: 54 / 255,
                                                                             alpha: 1.0)
            break
        case 2:
            appDelegate.tabController?.buttonsBackgroundColor = UIColor.init(red: 215 / 255,
                                                                             green: 215 / 255,
                                                                             blue: 215 / 255,
                                                                             alpha: 1.0)
        default:
            break
        }
    }
}
