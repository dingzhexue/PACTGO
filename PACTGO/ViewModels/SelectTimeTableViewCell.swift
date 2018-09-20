//
//  SelectTimeTableViewCell.swift
//  PACTGO
//
//  Created by 123 on 2018/09/19.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit

class SelectTimeTableViewCell: UITableViewCell {

    @IBOutlet weak var timelabel: UILabel!
    @IBOutlet weak var bookStatusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(index: Int) {
        // Placeholder code
        if index + 6 < 12 {
            self.timelabel.text = "\(index + 6):00 am"
        } else if index + 6 == 12{
            self.timelabel.text = "12:00 pm"
        } else {
            self.timelabel.text = "\(index + 6 - 12):00 pm"
        }
        if index % 4 == 3 {
            bookStatusLabel.text = "Booked"
            self.timelabel.textColor = UIColor.black
            self.bookStatusLabel.textColor = UIColor.black
            self.backgroundColor = UIColor.init(red: 43.0/255.0, green: 192.0/255, blue: 189.0/255.0, alpha: 1.0)
        } else {
            self.timelabel.textColor = UIColor.lightGray
            self.bookStatusLabel.textColor = UIColor.lightGray
            bookStatusLabel.text = "Book Appointment"
            self.backgroundColor = UIColor.clear
        }
    }
}
