//
//  CSExtension.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/1.
//  Copyright © 2019 hanxing. All rights reserved.
//

import Foundation

extension DispatchQueue {
    
    static var onceTokens = [String]()
    public class func once(token : String , callback : () -> ())  {
        
        objc_sync_enter(self)
        
        defer {
            objc_sync_exit(self)
        }
    
        if onceTokens.contains(token) {
            return
        }
        
        onceTokens.append(token)
        callback()
    }
    
}

