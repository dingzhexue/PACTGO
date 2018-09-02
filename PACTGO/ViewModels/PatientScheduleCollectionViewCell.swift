//
//  PatientScheduleCollectionViewCell.swift
//  PACTGO
//
//  Created by admin on 8/31/18.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit

class PatientScheduleCollectionViewCell: UICollectionViewCell{
    @IBOutlet weak var therapyAppointment: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
