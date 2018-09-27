//
//  SignInViewController.swift
//  PACTGO
//
//  Created by admin on 8/29/18.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit
import SideMenuSwift

class SignInViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.isHidden = false
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
    
    func initUI(){
        title = "Sign in"
        let leftBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "back-arrow").withRenderingMode(.alwaysOriginal),
                                      style: .plain,
                                      target: self,
                                      action: #selector(btnBackTapped))
        navigationItem.leftBarButtonItem = leftBtn

        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: "Muli-SemiBold", size: 17)!,
                                                                   NSAttributedStringKey.foregroundColor: UIColor.white]
        
    }
    
    // MARK: - Navigation button actions
    @objc func btnBackTapped(){
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - UIButton actions
    @IBAction func btnSignUpHereTapped(_ sender: Any) {
        
    }

    @IBAction func btnSignInTapped(_ sender: Any) {
        let menuVC = self.storyboard?.instantiateViewController(withIdentifier: "SideMenuViewController")
        let targetVC = self.storyboard?.instantiateViewController(withIdentifier: "MainRootViewController")
        //        window = UIWindow(frame: UIScreen.main.bounds)
        //        window?.rootViewController = SideMenuController(contentViewController: self,
        //                                                        menuViewController: menuVC!)
        self.navigationController?.pushViewController(SideMenuController(contentViewController: targetVC!, menuViewController: menuVC!),
                                                      animated: true)
        SideMenuController.preferences.basic.menuWidth = 240
        SideMenuController.preferences.basic.statusBarBehavior = .fade
        SideMenuController.preferences.basic.direction = .right
        SideMenuController.preferences.basic.enablePanGesture = true
        SideMenuController.preferences.basic.supportedOrientations = .portrait
        navigationController?.isNavigationBarHidden = true
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
