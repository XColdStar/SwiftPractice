//
//  CSBaseViewController.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/1.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit
import HandyJSON

class CSBaseViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.initTabBarItem()
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    

}

extension CSBaseViewController {
    
    @objc func initTabBarItem() {
        
    }
    
}
