//
//  FindYourTherapistViewController.swift
//  PACTGO
//
//  Created by 123 on 2018/09/20.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit
import ActiveLabel

class FindYourTherapistViewController: UIViewController {

    @IBOutlet weak var lblProfile: ActiveLabel!
    
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
        title = "Find Your\nTherapist!"
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        titleLabel.numberOfLines = 2
        titleLabel.text = title
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "Muli-SemiBold", size: 14)
        navigationItem.titleView = titleLabel
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
        
        let customType = ActiveType.custom(pattern: "Read More")
        lblProfile.enabledTypes = [customType]
        lblProfile.text = "Clinton Courtney, MCEP is the founder of PACTGO, PACT NYC and Major League Rugby, MLR respectively. Clinton serviced the New York sports and orthopedic world, contributing to the injury prevention... Read More"
        lblProfile.handleCustomTap(for: customType) { (string) in
            self.performSegue(withIdentifier: "GoToTherapistViewController", sender: self)
        }
        lblProfile.customColor[customType] = UIColor(red: 0,
                                                     green: 204 / 256,
                                                     blue: 201 / 256,
                                                     alpha: 1.0)
        lblProfile.numberOfLines = 0
        lblProfile.lineSpacing = 5
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
