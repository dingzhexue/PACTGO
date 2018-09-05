//
//  HelpDetailViewController.swift
//  PACTGO
//
//  Created by Admin on 5/29/18.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit

class HelpDetailViewController: UIViewController {

    @IBOutlet weak var lblContent: UILabel!
    var titleText = ""
    var contentText = ""
    
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
        title = titleText
        lblContent.text = contentText
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
