//
//  HurtViewController.swift
//  PACTGO
//
//  Created by admin on 8/30/18.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit

class HurtViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var txtDetail: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var btnBackPain: UIButton!
    @IBOutlet weak var btnNeckPain: UIButton!
    @IBOutlet weak var btnAnklePain: UIButton!
    @IBOutlet weak var btnArmPain: UIButton!
    @IBOutlet weak var btnHipPain: UIButton!
    @IBOutlet weak var btnKneePain: UIButton!
    @IBOutlet weak var btnShoulderPain: UIButton!
    
    var isBackPainSelected = false
    var isNeckPainSelected = false
    var isAnklePainSelected = false
    var isArmPainSelected = false
    var isHipPainSelected = false
    var isKneePainSelected = false
    var isShoulderPainSelected = false
    
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
        title = "Select What Hurts?"
        let rightBtn = UIBarButtonItem(title: "Continue",
                                       style: .plain,
                                       target: self,
                                       action: #selector(btnContinueTapped))
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
        if isBackPainSelected {
            btnBackPain.setImage(#imageLiteral(resourceName: "circle-checkmark"), for: .normal)
        } else {
            btnBackPain.setImage(#imageLiteral(resourceName: "selection-round"), for: .normal)
        }
        if isNeckPainSelected {
            btnNeckPain.setImage(#imageLiteral(resourceName: "circle-checkmark"), for: .normal)
        } else {
            btnNeckPain.setImage(#imageLiteral(resourceName: "selection-round"), for: .normal)
        }
        if isAnklePainSelected {
            btnAnklePain.setImage(#imageLiteral(resourceName: "circle-checkmark"), for: .normal)
        } else {
            btnAnklePain.setImage(#imageLiteral(resourceName: "selection-round"), for: .normal)
        }
        if isArmPainSelected {
            btnArmPain.setImage(#imageLiteral(resourceName: "circle-checkmark"), for: .normal)
        } else {
            btnArmPain.setImage(#imageLiteral(resourceName: "selection-round"), for: .normal)
        }
        if isHipPainSelected {
            btnHipPain.setImage(#imageLiteral(resourceName: "circle-checkmark"), for: .normal)
        } else {
            btnHipPain.setImage(#imageLiteral(resourceName: "selection-round"), for: .normal)
        }
        if isKneePainSelected {
            btnKneePain.setImage(#imageLiteral(resourceName: "circle-checkmark"), for: .normal)
        } else {
            btnKneePain.setImage(#imageLiteral(resourceName: "selection-round"), for: .normal)
        }
        if isShoulderPainSelected {
            btnShoulderPain.setImage(#imageLiteral(resourceName: "circle-checkmark"), for: .normal)
        } else {
            btnShoulderPain.setImage(#imageLiteral(resourceName: "selection-round"), for: .normal)
        }
    }
    
    // MARK: - Navigation button actions
    @objc func btnContinueTapped(){
        performSegue(withIdentifier: "GoToFindYourTherapistPage", sender: self)
    }
    
    @objc func btnBackTapped(){
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnBackPainTapped(_ sender: Any) {
        isBackPainSelected = !isBackPainSelected
        if isBackPainSelected {
            btnBackPain.setImage(#imageLiteral(resourceName: "circle-checkmark"), for: .normal)
        } else {
            btnBackPain.setImage(#imageLiteral(resourceName: "selection-round"), for: .normal)
        }
    }
    
    @IBAction func btnNeckPainTapped(_ sender: Any) {
        isNeckPainSelected = !isNeckPainSelected
        if isNeckPainSelected {
            btnNeckPain.setImage(#imageLiteral(resourceName: "circle-checkmark"), for: .normal)
        } else {
            btnNeckPain.setImage(#imageLiteral(resourceName: "selection-round"), for: .normal)
        }
    }
    
    @IBAction func btnAnklePainTapped(_ sender: Any) {
        isAnklePainSelected = !isAnklePainSelected
        if isAnklePainSelected {
            btnAnklePain.setImage(#imageLiteral(resourceName: "circle-checkmark"), for: .normal)
        } else {
            btnAnklePain.setImage(#imageLiteral(resourceName: "selection-round"), for: .normal)
        }
    }
    
    @IBAction func btnArmPainTapped(_ sender: Any) {
        isArmPainSelected = !isArmPainSelected
        if isArmPainSelected {
            btnArmPain.setImage(#imageLiteral(resourceName: "circle-checkmark"), for: .normal)
        } else {
            btnArmPain.setImage(#imageLiteral(resourceName: "selection-round"), for: .normal)
        }
    }
    
    @IBAction func btnHipPainTapped(_ sender: Any) {
        isHipPainSelected = !isHipPainSelected
        if isHipPainSelected {
            btnHipPain.setImage(#imageLiteral(resourceName: "circle-checkmark"), for: .normal)
        } else {
            btnHipPain.setImage(#imageLiteral(resourceName: "selection-round"), for: .normal)
        }
    }
    
    @IBAction func btnKneePainTapped(_ sender: Any) {
        isKneePainSelected = !isKneePainSelected
        if isKneePainSelected {
            btnKneePain.setImage(#imageLiteral(resourceName: "circle-checkmark"), for: .normal)
        } else {
            btnKneePain.setImage(#imageLiteral(resourceName: "selection-round"), for: .normal)
        }
    }
    
    @IBAction func btnShulderPainTapped(_ sender: Any) {
        isShoulderPainSelected = !isShoulderPainSelected
        if isShoulderPainSelected {
            btnShoulderPain.setImage(#imageLiteral(resourceName: "circle-checkmark"), for: .normal)
        } else {
            btnShoulderPain.setImage(#imageLiteral(resourceName: "selection-round"), for: .normal)
        }
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
