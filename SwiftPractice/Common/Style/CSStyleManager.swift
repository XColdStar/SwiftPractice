
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

class CSStyleManager: NSObject {

    
}

//Mark：设置颜色值
extension CSStyleManager {
    
    static var mColor : UIColor? = nil
    static func mainColor() -> (UIColor) {
        DispatchQueue.once() {
            mColor = UIColor.hexColor(hexString: kMainColor)
        }
        return mColor ?? UIColor.black
    }
    
    static var tColor : UIColor? = nil
    static func titleColor() -> (UIColor) {
        DispatchQueue.once() {
            tColor = UIColor.hexColor(hexString: kTitleColor)
        }
        return tColor ?? UIColor.black
    }
    
    static var txtColor : UIColor? = nil
    static func textColor() -> (UIColor) {
        DispatchQueue.once() {
            txtColor = UIColor.hexColor(hexString: kTextColor)
        }
        return txtColor ?? UIColor.black
    }
    
    static var bgColor : UIColor? = nil
    static func backgroundColor() -> (UIColor) {
        DispatchQueue.once() {
            bgColor = UIColor.hexColor(hexString: kBgColor)
        }
        return bgColor ?? UIColor.white
    }
    
    static var lColor : UIColor? = nil
    static func lineColor() -> (UIColor) {
        DispatchQueue.once() {
            lColor = UIColor.hexColor(hexString: kLineColor)
        }
        return lColor ?? UIColor.gray
    }
    
}

//Mark：设置字体
extension CSStyleManager {
    
    static var rFont : UIFont? = nil
    static func regularFont(size : CGFloat) -> (UIFont) {
        DispatchQueue.once() {
            rFont = UIFont.systemFont(ofSize: size)
        }
        return rFont!
    }
    
    static var lFont : UIFont? = nil
    static func lightFont(size : CGFloat) -> (UIFont) {
        DispatchQueue.once() {
            lFont = UIFont.systemFont(ofSize: size, weight: .light)
        }
        return lFont!
    }
    
    static var mFont : UIFont? = nil
    static func mediumFont(size : CGFloat) -> (UIFont) {
        DispatchQueue.once() {
            mFont = UIFont.systemFont(ofSize: size, weight: .medium)
        }
        return mFont!
    }
    
    static var bFont : UIFont? = nil
    static func boldFont(size : CGFloat) -> (UIFont) {
        DispatchQueue.once() {
            bFont = UIFont.systemFont(ofSize: size, weight: .bold)
        }
        return bFont!
    }
    
}
