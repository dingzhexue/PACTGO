//
//  SelectDateCollectionViewCell.swift
//  PACTGO
//
//  Created by 123 on 2018/09/19.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit

class SelectDateCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var bookContentLabel: UILabel!
    
    func setUpCell(date: Int, bookContent: String) {
        dateLabel.text = "\(date)"
        bookContentLabel.text = bookContent
    }
}
