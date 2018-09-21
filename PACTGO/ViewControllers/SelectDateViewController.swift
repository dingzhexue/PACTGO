//
//  SelectDateViewController.swift
//  PACTGO
//
//  Created by 123 on 2018/09/19.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit

class SelectDateViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var dateCollectionView: UICollectionView!
    let calendar = Calendar.current
    
    var startDate: MonthDate!
    var startWeekDay: Int!
    var numberOfDays: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dateCollectionView.delegate = self
        dateCollectionView.dataSource = self
        
        startDate = self.monthDate(from: Date())
        let startDay = startDayAtMonth(in: 0)
        startWeekDay = calendar.component(.weekday, from: startDay) - 1
        numberOfDays = calendar.numberOfDaysInMonth(date: startDay)
        initUI()
    }
    
    func startDayAtMonth(in section: Int) -> Date {
        return dateAt(IndexPath(item: 0, section: section))
    }
    
    func dateAt(_ indexPath: IndexPath) -> Date {
        var comp = DateComponents()
        comp.month = indexPath.section
        comp.day = indexPath.row
        return calendar.date(byAdding: comp, to: dateFrom(monthDate: startDate))!
    }
    
    func dateFrom(monthDate: MonthDate) -> Date {
        return calendar.date(from: monthDate)
    }
    
    func monthDate(from date: Date) -> MonthDate {
        return calendar.monthDate(from: date)
    }
    
    func initUI(){
        title = "Select Date"
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
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    
    // MARK: - Navigation button actions
    @objc func btnMenuTapped(){
        sideMenuController?.revealMenu()
    }
    
    @objc func btnBackTapped(){
        navigationController?.popViewController(animated: true)
    }
}

extension SelectDateViewController{
    // MARK: DateCollectionView Datasource and Delegate
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 42
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "select_date_cell", for: indexPath) as! SelectDateCollectionViewCell
        if indexPath.row < startWeekDay || indexPath.row > startWeekDay + numberOfDays - 1 {
            cell.backView.isHidden = true
            cell.backgroundColor = UIColor.clear
        } else {
            var tempIndexPath = indexPath
            tempIndexPath.row = indexPath.row - startWeekDay
            let date = dateAt(tempIndexPath)
            cell.setUpCell(date: calendar.day(date), bookContent: "")
            if indexPath.row % 7 == 0 || indexPath.row % 7 == 6 {
                cell.backView.backgroundColor = UIColor.lightGray
            } else {
                if indexPath.row % 4 != 0 {
                    cell.backView.backgroundColor = UIColor.init(red: 23.0/255.0, green: 208.0/255.0, blue: 206.0/255.0, alpha: 1.0)
                } else {
                    cell.backView.backgroundColor = UIColor.init(red: 198.0/255.0, green: 118.0/255.0, blue: 98.0/255.0, alpha: 1.0)
                    cell.bookContentLabel.text = "9-11 am Sholder Therapy Appointment"
                }
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row < startWeekDay || indexPath.row > startWeekDay + numberOfDays - 1 {
            print("cannot select")
        } else {
            if indexPath.row % 7 == 0 || indexPath.row % 7 == 6 {
                print("already booked")
            } else {
                if indexPath.row % 4 != 0 {
                    self.performSegue(withIdentifier: "SelectTimeViewSegue", sender: self)
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width - 6 * 4) / 7, height: (collectionView.frame.size.height - 8 * 5) / 6)
    }
}
