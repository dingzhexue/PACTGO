//
//  CircleImageView.swift
//  PACTGO
//
//  Created by 123 on 2018/09/19.
//  Copyright © 2018 PACTGO. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initImageView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initImageView()
    }
    
    func initImageView() {
        let layer = self.layer as CALayer
        layer.masksToBounds = true
        layer.cornerRadius = self.bounds.size.height/2
    }

}
