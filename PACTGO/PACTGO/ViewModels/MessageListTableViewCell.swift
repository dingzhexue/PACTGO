//
//  MessageListItemTableViewCell.swift
//  PACTGO
//
//  Created by admin on 8/30/18.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit

class MessageListItemTableViewCell: UITableViewCell {
    
   
    @IBOutlet weak var MessageCheckBox: UIButton!
    @IBOutlet weak var MessageFavourite: UIButton!
    @IBOutlet weak var MessageName: UILabel!
    @IBOutlet weak var MessageAppointment: UILabel!
    @IBOutlet weak var MessageDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
