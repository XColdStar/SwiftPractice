//
//  CSBaseModel.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/6/26.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit
import HandyJSON

class CSBaseModel: HandyJSON {
    
    required init() {
        
    }
    
}

protocol CSBaseModelProtocol {
    static func jsonToModel(json : String) -> HandyJSON?
}

