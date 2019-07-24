//
//  CSBaseCollectionViewCell.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/24.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit


class CSBaseCollectionViewCell: UICollectionViewCell {

    var data: Any?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor.white
        configUI()
        configConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configUI() {
        
    }
    
    func configConstraint() {
        
    }
    
}
