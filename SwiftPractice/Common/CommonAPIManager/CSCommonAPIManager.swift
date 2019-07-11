//
//  CSCommonAPIManager.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/1.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit
import HandyJSON

class CSCommonAPIManager: NSObject {

    static let kSendCodeApi  = "/api/sendcode4loginJson"
    static let kLoginApi = "/api/login"
    
    
    //发送验证码
    class func SendCode(params : Dictionary<String, Any>, modelClass: CSBaseModelProtocol.Type? ,finishCallback :  @escaping (Bool , Optional<Any>, String) -> ()) {
        CSRequestManager.POSTRequest(url: kSendCodeApi, params: params, modelClass: modelClass, finishCallback: finishCallback)
    }
    
    //登录
    class func Login(params : Dictionary<String, Any> , modelClass:  CSBaseModelProtocol.Type? ,finishCallback :  @escaping (Bool , Optional<Any>, String) -> ()) {
        CSRequestManager.POSTRequest(url: kLoginApi, params: params, modelClass: modelClass, finishCallback: finishCallback)
    }
    
    
}
