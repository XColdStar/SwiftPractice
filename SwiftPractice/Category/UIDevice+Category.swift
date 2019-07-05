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
    
    static func width() -> (CGFloat) {
        return UIScreen.main.bounds.width
    }
    
    static func height() -> (CGFloat) {
        return UIScreen.main.bounds.height
    }
    
}
