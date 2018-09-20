//
//  MessageListTableViewCell.swift
//  PACTGO
//
//  Created by 123 on 2018/09/19.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit

class MessageListTableViewCell: UITableViewCell {
    @IBOutlet weak var selectionImage: UIImageView!
    @IBOutlet weak var favouriteImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var appointmentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
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
        if index % 6 == 1 {
            self.favouriteImage.image = #imageLiteral(resourceName: "staricon-logo2")
            nameLabel.text = "Dr. Clinton"
            appointmentLabel.text = "Appointment Confirmation"
            dateLabel.text = "Aug. 20"
        }  else {
            self.favouriteImage.image = #imageLiteral(resourceName: "starticon-logo1")
            nameLabel.text = "Dr. Clinton"
            appointmentLabel.text = "Appointment Confirmation"
            dateLabel.text = "Aug. 20"
        }
    }

}
