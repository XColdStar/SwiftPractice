
//
//  CSStyleManager.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/2.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit

let kMainColor = "#00910E"
let kTitleColor = "#333333"
let kTextColor = "#666666"
let kBgColor   = "#F5F5F5"
let kLineColor = "#D8D8D8"
let kRedColor = "#E1514F"

class CSStyleManager: NSObject {

    
}

//Mark：设置颜色值
extension CSStyleManager {
    
    static var mColor : UIColor? = nil
    static let mainColorOnceToken = NSUUID().uuidString
    static func mainColor() -> (UIColor) {
        print("mainColorOnceToken：\(mainColorOnceToken)")
        DispatchQueue.once(token: mainColorOnceToken) {
            mColor = UIColor.hexColor(hexString: kMainColor)
        }
        return mColor ?? UIColor.black
    }
    
    static var tColor : UIColor? = nil
    static let titleColorOnceToken = NSUUID().uuidString
    static func titleColor() -> (UIColor) {
        print("titleColorOnceToken：\(titleColorOnceToken)")
        DispatchQueue.once(token: titleColorOnceToken) {
            tColor = UIColor.hexColor(hexString: kTitleColor)
        }
        return tColor ?? UIColor.black
    }
    
    static var txtColor : UIColor? = nil
    static let textColorOnceToken = NSUUID().uuidString
    static func textColor() -> (UIColor) {
        print("textColorOnceToken：\(textColorOnceToken)")
        DispatchQueue.once(token: textColorOnceToken) {
            txtColor = UIColor.hexColor(hexString: kTextColor)
        }
        return txtColor ?? UIColor.black
    }
    
    static var bgColor : UIColor? = nil
    static let backgroundColorOnceToken = NSUUID().uuidString
    static func backgroundColor() -> (UIColor) {
        print("backgroundColorOnceToken：\(backgroundColorOnceToken)")
        DispatchQueue.once(token: backgroundColorOnceToken) {
            bgColor = UIColor.hexColor(hexString: kBgColor)
        }
        return bgColor ?? UIColor.white
    }
    
    static var lColor : UIColor? = nil
    static let lineColorOnceToken = NSUUID().uuidString
    static func lineColor() -> (UIColor) {
        print("lineColorOnceToken：\(lineColorOnceToken)")
        DispatchQueue.once(token: lineColorOnceToken) {
            lColor = UIColor.hexColor(hexString: kLineColor)
        }
        return lColor ?? UIColor.gray
    }
    
    static var rColor : UIColor? = nil
    static let redColorOnceToken = NSUUID().uuidString
    static func redColor() -> (UIColor) {
        print("redColorOnceToken：\(redColorOnceToken)")
        DispatchQueue.once(token: redColorOnceToken) {
            rColor = UIColor.hexColor(hexString: kRedColor)
        }
        return rColor ?? UIColor.gray
    }
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
