//
//  CSMineViewController.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/1.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit

class CSMineViewController: CSBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    
}

extension CSMineViewController {
    
    override func initTabBarItem() {
        
        let tabbarItem = UITabBarItem(title: "我的", image: UIImage(named: "xm_my_unSelected")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "xm_my_selected")?.withRenderingMode(.alwaysOriginal))
        tabbarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.gray, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 9)], for: .normal)
        tabbarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.green, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 11)], for: .selected)
        self.tabBarItem = tabbarItem
        
    }
    
}
