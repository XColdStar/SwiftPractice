//
//  CSCacheModel.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/11.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class CSCacheModel: Object {
    
    @objc dynamic var cacheData: Data?
    
}
