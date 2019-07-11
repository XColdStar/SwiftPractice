//
//  NSMutableDictionary + Category.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/8.
//  Copyright © 2019 hanxing. All rights reserved.
//

import Foundation

extension NSMutableDictionary {
    
    func setSafeObject(obj : Optional<Any>,  forKey : NSCopying) -> () {
        if let safeObj = obj {
            self.setObject(safeObj , forKey: forKey)
        }
    }
    
}

