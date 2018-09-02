//
//  PatientHistoryTableViewCell.swift
//  PACTGO
//
//  Created by admin on 8/30/18.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit

class PatientHistoryTableViewCell: UITableViewCell {
    @IBOutlet weak var PainHistoryCell: UILabel!
    @IBOutlet weak var PainHistoryBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
