//
//  PatientHistoryList2TableViewCell.swift
//  PACTGO
//
//  Created by admin on 8/31/18.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit

class PatientHistoryList2TableViewCell: UITableViewCell {
    @IBOutlet weak var timeField: UITextField!
    @IBOutlet weak var clickBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
