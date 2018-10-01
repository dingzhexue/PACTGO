//
//  PatientScheduleViewController.swift
//  PACTGO
//
//  Created by admin on 8/31/18.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit

class PatientScheduleViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var scheduleCollectionView: UICollectionView!
    @IBOutlet weak var patientScheduleTableView: UITableView!
    @IBOutlet weak var tableContainer: UIView!
    @IBOutlet weak var collectionContainer: UIView!
    @IBOutlet weak var btnList: UIButton!
    @IBOutlet weak var btnGrid: UIButton!
    
    let calendar = Calendar.current
    
    var startDate: MonthDate!
    var startWeekDay: Int!
    var numberOfDays: Int!
    
    var weekDays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
        initUI()
        scheduleCollectionView.delegate = self
        scheduleCollectionView.dataSource = self
        
        patientScheduleTableView.dataSource = self
        patientScheduleTableView.delegate = self
        
        startDate = self.monthDate(from: Date())
        let startDay = startDayAtMonth(in: 0)
        startWeekDay = calendar.component(.weekday, from: startDay) - 1
        numberOfDays = calendar.numberOfDaysInMonth(date: startDay)
        
        btnList.isSelected = false
        btnGrid.isSelected = true
        
        collectionContainer.isHidden = false
        tableContainer.isHidden = true
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
        
        title = "Patient\nSchedule"
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
        navigationItem.titleView?.tintColor = UIColor.white
        navigationItem.rightBarButtonItem = rightBtn
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: "Muli-SemiBold", size: 17)!,
                                                                   NSAttributedStringKey.foregroundColor: UIColor.white]
        
    }
    
    // MARK: - Navigation button actions
    @objc func btnMenuTapped(){
        sideMenuController?.revealMenu()
    }
    
    @IBAction func tapListType(_ sender: Any) {
        let button = sender as! UIButton
        if button == btnList {
            btnList.isSelected = true
            btnGrid.isSelected = false
            tableContainer.isHidden = false
            collectionContainer.isHidden = true
        } else {
            btnList.isSelected = false
            btnGrid.isSelected = true
            tableContainer.isHidden = true
            collectionContainer.isHidden = false
        }
    }
}

// MARK: PatientScheduleTableView Datasource and Delegate
extension PatientScheduleViewController{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        return 32
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 24
    }
    
    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "patient_schedule_header_cell") as! PatientScheduleHeaderTableViewCell
        header.weekdayLabel.text = weekDays[section]
        return header
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "patient_schedule_cell",
                                                 for: indexPath) as! PatientScheduleTableViewCell
        if indexPath.row % 3 != 0 {
            cell.checkBtn.image = #imageLiteral(resourceName: "checkline-logo")
        } else {
            cell.checkBtn.image = #imageLiteral(resourceName: "checkmark-logo")
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
    }
}

// MARK: PatientScheduleCollectionView Datasource and Delegate
extension PatientScheduleViewController{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 42
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "schedule_select_date_cell",
                                                      for: indexPath) as! PatientScheduleCollectionViewCell
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
                    cell.backView.backgroundColor = UIColor.init(red: 23.0/255.0,
                                                                 green: 208.0/255.0,
                                                                 blue: 206.0/255.0,
                                                                 alpha: 1.0)
                } else {
                    cell.backView.backgroundColor = UIColor.init(red: 198.0/255.0,
                                                                 green: 118.0/255.0,
                                                                 blue: 98.0/255.0,
                                                                 alpha: 1.0)
                    cell.bookContentLabel.text = "9-11 am Shoulder Therapy Appointment"
                }
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        //        if indexPath.row < startWeekDay || indexPath.row > startWeekDay + numberOfDays - 1 {
        //            print("cannot select")
        //        } else {
        //            if indexPath.row % 7 == 0 || indexPath.row % 7 == 6 {
        //                print("already booked")
        //            } else {
        //                if indexPath.row % 4 != 0 {
        //                    self.performSegue(withIdentifier: "SelectTimeViewSegue", sender: self)
        //                }
        //            }
        //        }
        performSegue(withIdentifier: "GoToScheduleDetailViewController",
                     sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout, sizeForItemAt
        indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width - 6 * 4) / 7,
                      height: (collectionView.frame.size.height - 8 * 5) / 6)
    }
}
