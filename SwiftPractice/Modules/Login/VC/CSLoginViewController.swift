//
//  CSLoginViewController.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/1.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit

class CSLoginViewController: CSBaseViewController {

    lazy var closeBtn : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "xmCloseIcon"), for: .normal)
        button.addTarget(self, action: Selector(("clickedClose:")), for: .touchUpInside)
        return button
    }()
    
    lazy var fastLoginLabel : UILabel = {
        let label = UILabel()
        label.font = CSStyleManager.regularFont(size: 18)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
}

extension CSLoginViewController {
    
    
    
    
    fileprivate func clickedClose(button : UIButton) {
        print("关闭")
    }
    
    fileprivate func configUI() -> () {
        
       
        
    }
}
