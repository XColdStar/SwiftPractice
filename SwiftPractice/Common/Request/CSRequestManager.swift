//
//  CSRequestManager.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/6/26.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit
import SwiftyJSON

class CSRequestManager: CSBaseHTTPRequestManager {
    
}

//MARK: ### GET ###
extension CSRequestManager {
    
    class func GETRequest(url : String, params : Dictionary<String, Any>, modelClass: CSBaseModelProtocol.Type? , finishCallback :  @escaping (Bool , Optional<Any> , String) -> () ) {
        let fullUrl = _RequestFullApi(api: url)
        _GETRequest(url: fullUrl, params: params) { (isSuccess, result, msg)  in
            
            if isSuccess {
                
                let jsonData = result as! JSON
                guard modelClass != nil else {
                    finishCallback(true, jsonData, msg)
                    return
                }
                
                if let jsonString = jsonData["data"].rawString() {
                    let model = modelClass!.jsonToModel(json: jsonString)
                    finishCallback(true, model, msg)
                } else {
                    finishCallback(false, jsonData, msg)
                }
                
            } else {
                finishCallback(false, result, msg)
            }
            
        }
    }
    
}

//MARK: ### POST ###
extension CSRequestManager {
    
    class func POSTRequest(url : String, params : Dictionary<String, Any>,  modelClass: CSBaseModelProtocol.Type? , finishCallback :  @escaping (Bool , Optional<Any>, String) -> () ) {
        let fullUrl = _RequestFullApi(api: url)
        _POSTRequest(url: fullUrl, params: params) { (isSuccess, result, msg) in
            
            if isSuccess {
                
                let jsonData = result as! JSON
                guard modelClass != nil else {
                    finishCallback(true, jsonData, msg)
                    return
                }
                
                if let jsonString = jsonData["data"].rawString() {
                    let model = modelClass!.jsonToModel(json: jsonString)
                    finishCallback(true, model, msg)
                } else {
                    finishCallback(false, jsonData, msg)
                }
                
        
            } else {
                finishCallback(false, result, msg)
            }
            
        }
    }
    
}

//MARK: ### Get完整URL ###
extension CSRequestManager {
    
     fileprivate class func _RequestFullApi(api : String ) -> (String) {
        
        var host : String? = nil
        switch kAppEnvironment {
        case 1:
            host = kTestHost
        case 2:
            host = kPreHost
        default:
            host = kOnlineHost
        }
        return (host ?? kOnlineHost) + api
        
    }
    
}
