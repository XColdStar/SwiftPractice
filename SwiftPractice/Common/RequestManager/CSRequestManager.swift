//
//  CSRequestManager.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/6/26.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit

class CSRequestManager: CSBaseHTTPRequestManager {

    class func GETRequest(url : String, params : NSDictionary, modelClass : AnyClass, finishCallback :  @escaping (Bool , Any) -> () ) {
        let fullUrl = _RequestFullApi(api: url)
        _GETRequest(url: fullUrl, params: params) { (isSuccess, result) in
            finishCallback(isSuccess, result)
        }
    }
    
    class func POSTRequest(url : String, params : NSDictionary, modelClass : AnyClass, finishCallback :  @escaping (Bool , Any) -> () ) {
         let fullUrl = _RequestFullApi(api: url)
        _POSTRequest(url: fullUrl, params: params) { (isSuccess, result) in
            finishCallback(isSuccess, result)
        }
    }
    
    class func _RequestFullApi(api : String ) -> (String) {
        
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
