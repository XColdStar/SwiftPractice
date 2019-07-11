//
//  CSLoginManager.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/6/28.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit
import HandyJSON

class CSLoginManager: NSObject {

    
    func sendCode(params : Dictionary<String, Any>, finishCallback : @escaping (Bool , Optional<Any>, String) -> ()) {
        
        CSCommonAPIManager.SendCode(params: params , modelClass: nil) { (isSuccess, result, msg) in
            finishCallback(isSuccess,result,msg)
        }
        
    }
    
    func login(params : Dictionary<String, Any> , finishCallback : @escaping (Bool , Optional<Any>, String) -> ()) {
        CSCommonAPIManager.Login(params: params , modelClass: CSUserInfoModel.self) { (isSuccess, result, msg) in
            finishCallback(isSuccess,result,msg)
        }
        
    }
    
    
}
