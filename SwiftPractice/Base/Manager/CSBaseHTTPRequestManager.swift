//
//  CSBaseHTTPRequestManager.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/6/26.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


let CSAuthorization = "Basic aW9zX2FwaV91c2VyOjIyYzlhMTZkN2RhNGM3NDI4NjE0NzAyY2JjYzhjODY1"
let kRequestSuccess = "请求成功"
let kRequestFailed = "请求失败~"

class CSBaseHTTPRequestManager: NSObject {
    
    static let httpHeader : HTTPHeaders = [
        "Authorization" : CSAuthorization,
        "version" : UIDevice.appVersion as! String,
    ]
    
}

//MARK: ### GET ###
extension CSBaseHTTPRequestManager {
    
    class func _GETRequest(url : String, params : Dictionary<String, Any>,   finishCallback :  @escaping (Bool,Optional<Any>,String) -> ())  {
        
        print("GETRequestURL：\(url)")
        Alamofire.request(url, method: .get, parameters: params, encoding: JSONEncoding.default, headers: httpHeader).responseJSON { (response) in
            let result = response.result.value
            guard result != nil else {
                print(response.result.error ?? "\(url)---GET请求失败！")
                finishCallback(false,NSError(domain: "\(url)---GET请求失败！", code: 0, userInfo: params),kRequestFailed)
                return
            }
            CSBaseHTTPRequestManager.HandleJsonData(result: result!, finishCallback: finishCallback)
        }
        
    }
    
}

//MARK: ### POST ###
extension CSBaseHTTPRequestManager {
    
    class func _POSTRequest(url : String, params : Dictionary<String, Any>, finishCallback : @escaping (Bool,Optional<Any>,String) -> ()) {
        
        print("POSTRequestURL：\(url)")
        Alamofire.request(URL(string: url) ?? "", method: .post, parameters: params, encoding: JSONEncoding.default, headers: httpHeader).responseJSON { (response) in
            let result = response.result.value
            guard result != nil else {
                let error = response.result.error
                print(error ?? "\(url)---POST请求失败！")
                finishCallback(false,error as AnyObject? ?? NSError(domain: "\(url)---POST请求失败！", code: 0, userInfo: params),kRequestFailed)
                return
            }
            CSBaseHTTPRequestManager.HandleJsonData(result: result!, finishCallback: finishCallback)
        }
        
    }
    
}

//MARK: ### json数据处理 ###
extension CSBaseHTTPRequestManager {
    
    fileprivate class func HandleJsonData(result: Any, finishCallback : (Bool, Optional<Any>, String)-> ()) {
        let json = JSON(result)
        let code = json["code"].int
        let msg = json["msg"].string
        print("\(String(describing: json.rawString()))")
        
        if code == 111 {
            finishCallback(true, json, msg ?? kRequestSuccess)
        }
        else {
            finishCallback(false, NSError(domain: "\(json)", code: code ?? 0, userInfo:nil), msg ?? kRequestFailed)
        }
    }
    
}
