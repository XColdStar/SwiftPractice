
//
//  CSStyleManager.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/2.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit

let kMainColor = "#00910E"
let kTitleColor = "#000000"
let kTextColor = "#666666"
let kF5Color   = "#F5F5F5"
let kD8Color = "#D8D8D8"
let kRedColor = "#E1514F"

class CSStyleManager: NSObject {

    static var manager : CSStyleManager? = nil
    static let styleOnceToken = NSUUID().uuidString
    static func share() -> (CSStyleManager) {
        DispatchQueue.once(token: styleOnceToken) {
            manager = CSStyleManager()
        }
        return manager!
    }
    
    //Mark：设置颜色值
    lazy var mainColor: UIColor = {
        return UIColor.hexColor(hexString: kMainColor)
    }()
    
    lazy var titleColor: UIColor = {
        return UIColor.hexColor(hexString: kTitleColor)
    }()
    
    lazy var textColor: UIColor = {
        return UIColor.hexColor(hexString: kTextColor)
    }()
    
    lazy var colorF5: UIColor = {
        return UIColor.hexColor(hexString: kF5Color)
    }()
    
    lazy var colorD8: UIColor = {
        return UIColor.hexColor(hexString: kD8Color)
    }()
    
    lazy var redColor: UIColor = {
        return UIColor.hexColor(hexString: kRedColor)
    }()
}

//Mark：设置字体
extension CSStyleManager {
    
    static func regularFont(_ size : CGFloat) -> (UIFont) {
        return UIFont.systemFont(ofSize: size)
    }

    static func lightFont(size : CGFloat) -> (UIFont) {
        return UIFont.systemFont(ofSize: size, weight: .light)
    }

    static func mediumFont(size : CGFloat) -> (UIFont) {
        return UIFont.systemFont(ofSize: size, weight: .medium)
    }
    
    static func boldFont(size : CGFloat) -> (UIFont) {
        return UIFont.systemFont(ofSize: size, weight: .bold)
    }
    
}
