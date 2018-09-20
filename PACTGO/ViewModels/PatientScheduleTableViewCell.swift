//
//  PatientScheduleTableViewCell.swift
//  PACTGO
//
//  Created by admin on 8/31/18.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit

class PatientScheduleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var therapyApp: UILabel!
    @IBOutlet weak var addRess: UILabel!
    @IBOutlet weak var checkBtn: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
