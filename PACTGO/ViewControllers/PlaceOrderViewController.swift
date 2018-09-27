//
//  PlaceOrderViewController.swift
//  PACTGO
//
//  Created by admin on 9/27/18.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit

class PlaceOrderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initUI()
        navigationController?.navigationBar.isHidden = false
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
        title = "Place Order"
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
