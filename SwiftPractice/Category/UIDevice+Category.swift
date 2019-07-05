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
    
    static var width : CGFloat =  {
        return UIScreen.main.bounds.width
    }()
    
    static var height : CGFloat =  {
        return UIScreen.main.bounds.height
    }()
    
    static var statusBarHeight : CGFloat = {
        return UIApplication.shared.statusBarFrame.height
    }()
    
    static var navigationBarHeight :CGFloat = {
        return 44.0 + UIDevice.statusBarHeight
    }()
    
    //MARK: ### 是否是phonex系列 ###
    static var isPhoneXSeries : Bool = {
        guard UIDevice.statusBarHeight > 20 else {
            return false
        }
        return true
    }()
    
}
