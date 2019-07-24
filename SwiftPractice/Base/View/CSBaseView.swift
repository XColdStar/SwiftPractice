//
//  CSBaseView.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/24.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit

class CSBaseView: UIView {

    var data: Any? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
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
