//
//  CSExtension.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/1.
//  Copyright © 2019 hanxing. All rights reserved.
//

import Foundation

extension DispatchQueue {
    private static var onceToken = ""
    class func once(token : String = "onceToken" , callback : () -> ())  {
        
        objc_sync_enter(self)
        
        do {
            objc_sync_exit(self)
        }

        if onceToken.contains(token) {
            return
        }
        
        onceToken.append(token)
        callback()
    }
}

