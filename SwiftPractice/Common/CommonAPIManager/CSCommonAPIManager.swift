//
//  CSCommonAPIManager.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/1.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit

class CSCommonAPIManager: NSObject {

    static let kLoginApi = "/api/login"
    
    //登录
    class func csLogin(params : NSDictionary , modelClass: AnyClass ,finishCallback :  @escaping (Bool , Any) -> ()) {
        CSRequestManager.POSTRequest(url: kLoginApi, params: params, modelClass: modelClass, finishCallback: finishCallback)
    }
    
}
