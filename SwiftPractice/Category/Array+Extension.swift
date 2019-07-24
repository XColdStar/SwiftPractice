//
//  Array+Extension.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/24.
//  Copyright © 2019 hanxing. All rights reserved.
//

import Foundation

extension Array {
    
    func safeIndex(index: NSInteger) -> Any? {
        guard index < self.count else {
            return nil
        }
        return self.index(after: index)
    }
//
//    mutating func safeAppend(newElement: Element) {
//        guard newElement != nil else { return }
//        self.append(newElement)
//    }
}
