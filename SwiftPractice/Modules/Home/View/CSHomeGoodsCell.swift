//
//  CSHomeGoodsCell.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/25.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit

class CSHomeGoodsCell: UICollectionViewCell {

    @IBOutlet weak var redLable1: UILabel!
    
    @IBOutlet weak var redLabel2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        redLable1.layer.borderWidth = 0.5;
        redLable1.layer.borderColor = CSStyleManager().redColor.cgColor
        
        redLabel2.layer.borderWidth = 0.5;
        redLabel2.layer.borderColor = CSStyleManager().redColor.cgColor
    }

}
