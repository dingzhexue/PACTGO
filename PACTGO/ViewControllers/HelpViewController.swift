//
//  HelpViewController.swift
//  PACTGO
//
//  Created by Admin on 5/29/18.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {
    
    var selectedFAQ = ""
    var selectedContent = ""

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
        navigationController?.navigationBar.isHidden = false
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
        hideKeyboardwhenTappedAround()
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
        title = "Help"
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
    
    // MARK: - Keyboard Notifications
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.setContentOffset(CGPoint(x:0, y:keyboardSize.height), animated: true)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if ((notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            scrollView.setContentOffset(CGPoint(x:0, y:-60), animated: true)
        }
    }
    
    // MARK: - UIButton actions
    @IBAction func btnFAQ1Tapped(_ sender: UIButton) {
        selectedFAQ = "Do you accept insurance?"
        selectedContent = "We are out-of-network for all insurance companies; However we will provide you with an invoice, itemizing the care provided to you. If your insurance provides out-of-network benefits, you may quialify for partial or complete reimbursement directly from your insurance company."
        performSegue(withIdentifier: "GoToHelpDetailPage",
                     sender: self)
    }
    
    @IBAction func btnFAQ2Tapped(_ sender: UIButton) {
        selectedFAQ = "How much does a session cost?"
        selectedContent = "We are out-of-network for all insurance companies; However we will provide you with an invoice, itemizing the care provided to you. If your insurance provides out-of-network benefits, you may quialify for partial or complete reimbursement directly from your insurance company."
        performSegue(withIdentifier: "GoToHelpDetailPage",
                     sender: self)
    }
    
    @IBAction func btnFAQ3Tapped(_ sender: UIButton) {
        selectedFAQ = "How far in advance do I need to schedule an appointment?"
        selectedContent = "We are out-of-network for all insurance companies; However we will provide you with an invoice, itemizing the care provided to you. If your insurance provides out-of-network benefits, you may quialify for partial or complete reimbursement directly from your insurance company."
        performSegue(withIdentifier: "GoToHelpDetailPage",
                     sender: self)
    }
    
    @IBAction func btnFAQ4Tapped(_ sender: UIButton) {
        selectedFAQ = "Where do you operate?"
        selectedContent = "We are out-of-network for all insurance companies; However we will provide you with an invoice, itemizing the care provided to you. If your insurance provides out-of-network benefits, you may quialify for partial or complete reimbursement directly from your insurance company."
        performSegue(withIdentifier: "GoToHelpDetailPage",
                     sender: self)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let vc = segue.destination as! HelpDetailViewController
        vc.titleText = selectedFAQ
        vc.contentText = selectedContent
    }
}
