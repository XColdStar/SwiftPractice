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
        
        var cstr = hexString.trimmingCharacters(in:  CharacterSet.whitespacesAndNewlines).uppercased() as NSString
        if cstr.length < 6 {
            return UIColor.black
        }
        
        if cstr.hasPrefix("#") {
            cstr = cstr.substring(from:1) as NSString
        }
        
        if cstr.length != 6 {
            return UIColor.black
        }
        
        var range = NSRange(location: 0, length: 2)

        let redStr = cstr.substring(with: range);

        range.location = 2
        let greenStr = cstr.substring(with: range)

        range.location = 4;
        let blueStr = cstr.substring(with: range)
        
        var r : UInt32 = 0x0
        var g : UInt32 = 0x0
        var b : UInt32 = 0x0
        
        Scanner(string: redStr).scanHexInt32(&r);
        Scanner(string: greenStr).scanHexInt32(&g);
        Scanner(string: blueStr).scanHexInt32(&b);
        
        let color = UIColor(red:CGFloat(r)/0xff, green:CGFloat(g)/0xff, blue:CGFloat(b)/0xff, alpha:CGFloat(1.0))
        
        return color

    }
    
    
}

