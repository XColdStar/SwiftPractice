//
//  CSBaseHTTPRequestManager.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/6/26.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit
import Alamofire

class CSBaseHTTPRequestManager: NSObject {
    
    static let CSAuthorization = "Basic aW9zX2FwaV91c2VyOjIyYzlhMTZkN2RhNGM3NDI4NjE0NzAyY2JjYzhjODY1"
    static let httpHeader = ["Authorization":CSAuthorization]
    
    class func _GETRequest(url : String, params : NSDictionary,   finishCallback :  @escaping (Bool,Any) -> ())  {
    
        print("GETRequestURL：\(url)")
        Alamofire.request(url, method: .get, parameters: params as? Parameters, encoding: String.Encoding.utf8 as! ParameterEncoding, headers: httpHeader).responseJSON { (response) in
            let result = response.result.value
            guard result != nil else {
                print(response.result.error ?? "\(url)---GET请求失败！")
                finishCallback(false,NSError(domain: "GET请求失败！", code: 0, userInfo: ["info":"\(url)---GET请求失败！"]))
                return
            }
            finishCallback(true,result ?? "GET请求数据为空！")
        }
        
    }
    
    class func _POSTRequest(url : String, params : NSDictionary, finishCallback : @escaping (Bool,Any) -> ()) {
        
        print("POSTRequestURL：\(url)")
        Alamofire.request(url, method: .post, parameters: params as? Parameters, encoding: String.Encoding.utf8 as! ParameterEncoding, headers: httpHeader).responseJSON { (response) in
            let result = response.result.value
            guard result != nil else {
                print(response.result.error ?? "\(url)---请求失败！")
                finishCallback(false,NSError(domain: "POST请求失败！", code: 0, userInfo: ["info":"\(url)---GET请求失败！"]))
                return
            }
            finishCallback(true,result ?? "POST请求数据为空！")
        }
        
    }
    
    
}
