//
//  CSRootVCManager.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/1.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit

class CSRootVCManager: NSObject {

    static var rootVC : UITabBarController? = nil
    
    static func defaultRootVC() -> (UITabBarController) {
        
        let onceToken = NSUUID().uuidString
        print("defaultRootVCToken：\(onceToken)")
        
        DispatchQueue.once(token: onceToken) {
            rootVC = UITabBarController()
            let homeVC = CSHomeViewController()
            homeVC.title = "首页"
            let homeNav = CSBaseNavigationController(rootViewController: homeVC)
            homeNav.tabBarItem = homeVC.tabBarItem
            
            let mineVC = CSMineViewController()
            mineVC.title = "我"
            let mineNav = CSBaseNavigationController(rootViewController: mineVC)
            mineNav.tabBarItem = mineVC.tabBarItem
            
            rootVC!.viewControllers = [homeNav,mineNav]
        }

        return rootVC!
    }
    
}
