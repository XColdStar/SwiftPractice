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
        configUI()
    }
    

}

extension CSBaseViewController {
    
    @objc func initTabBarItem() {
        
    }
    
    @objc func configUI() {
        
    }
    
    func setRightBarButtonItem(title: String? , imageName: String? , action: Selector) -> UIButton {
        
        let rightBarButtonItem = UIButton()
        rightBarButtonItem.frame.size = CGSize(width: 40, height: 40)
        rightBarButtonItem.backgroundColor = .red
        if title != nil {
            rightBarButtonItem.setTitle(title!, for: .normal)
        }
        if imageName != nil {
            rightBarButtonItem.setImage(UIImage(named: imageName!), for: .normal)
        }
        rightBarButtonItem.addTarget(self, action: action, for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBarButtonItem)
        return rightBarButtonItem
    }
    
    
}
