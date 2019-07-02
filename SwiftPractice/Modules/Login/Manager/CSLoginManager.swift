//
//  CSLoginManager.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/6/28.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit

class CSLoginManager: NSObject {

    func login(params : NSDictionary , finishCallback : @escaping (Any) -> ()) {
       
        CSCommonAPIManager.csLogin(params: params , modelClass: NSDictionary.self) { (isSuccess, result) in
            
        }
        
    }
    
}
