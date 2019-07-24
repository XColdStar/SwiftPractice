//
//  UIDevice+Category.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/2.
//  Copyright © 2019 hanxing. All rights reserved.
//

import Foundation
import UIKit

extension UIDevice {
    
    static let width : CGFloat =  {
        return UIScreen.main.bounds.width
    }()
    
    static let height : CGFloat =  {
        return UIScreen.main.bounds.height
    }()
    
    static let statusBarHeight : CGFloat = {
        return UIApplication.shared.statusBarFrame.height
    }()
    
    static let navigationBarHeight :CGFloat = {
        return 44.0 + UIDevice.statusBarHeight
    }()
    
    //MARK: ### 是否是phonex系列 ###
    static let isPhoneXSeries : Bool = {
        guard UIDevice.statusBarHeight > 20 else {
            return false
        }
        return true
    }()
    
    static let appVersion : Any = {
        return Bundle.main.infoDictionary? ["CFBundleShortVersionString"]
        }() ?? "1.0"
   
    static let appName : Any = {
        return Bundle.main.infoDictionary? ["CFBundleDisplayName"]
    }() ?? "name"
    

    static let mainWindow : UIWindow = {
        return UIApplication.shared.keyWindow!
    }()
    
}
