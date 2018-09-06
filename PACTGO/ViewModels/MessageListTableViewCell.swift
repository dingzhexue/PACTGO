//
//  MessageListTableViewCell.swift
//  PACTGO
//
//  Created by admin on 8/30/18.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit

class MessageListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var messageCheckBox: UIButton!
    @IBOutlet weak var messageFavorite: UIButton!
    @IBOutlet weak var messageName: UILabel!
    @IBOutlet weak var messageAppointment: UILabel!
    @IBOutlet weak var messageDate: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
