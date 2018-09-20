//
//  WelcomeViewController.swift
//  PACTGO
//
//  Created by Admin on 5/28/18.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

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
        
        let imageView = UIImageView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: 40,
                                                  height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "logo").withRenderingMode(.alwaysOriginal)
        navigationItem.titleView = imageView
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
