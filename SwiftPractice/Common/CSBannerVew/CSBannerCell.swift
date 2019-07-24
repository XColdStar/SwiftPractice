//
//  CSBannerCell.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/24.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit

class CSBannerCell: CSBaseCollectionViewCell {
    
    lazy var bannerImg: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = CSStyleManager().colorF5
        img.contentMode = UIView.ContentMode.scaleAspectFill
        return img
    }()
    
    override var data: Any? {
        didSet {
            print(data ?? "空值")
            if let url = data as? String {
                bannerImg.setImage(with: url)
            }
        }
    }
    
    override func configUI() {
        contentView.addSubview(bannerImg)
    }
    
    override func configConstraint() {
        bannerImg.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(contentView)
        }
    }
    
    
}
