//
//  UIColor+Category.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/2.
//  Copyright © 2019 hanxing. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static func hexColor(hexString : String) -> (UIColor) {
        
        let tempString = hexString.replacingOccurrences(of: "#", with: "")
        var colorCode : CUnsignedInt = 0
        let scanner = Scanner(string: tempString)
        scanner.scanHexInt32(&colorCode)
        let color = UIColor()
        return color
        
    }
    
    static func colorWithHexRGBCode(rgbCode : CUnsignedInt) -> (UIColor) {
        var color : UIColor
        var redByte, greenByte, blueByte : u_char
        redByte = (u_char) (rgbCode >> 16)
        greenByte = (u_char) (rgbCode >> 8)
        blueByte = (u_char)(rgbCode)
        color = UIColor(red: CGFloat(redByte / 0xFF), green: CGFloat(greenByte / 0xFF), blue: CGFloat(blueByte / 0xFF), alpha: 1)
        return color
    }
    
}

