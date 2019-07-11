//
//  CSUser.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/11.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit

class CSUser: CSBaseModel {

    var customer: CSUserInfoCustomer?
    var tokenInfo: CSUserInfoToken?
    var token = ""
    var isLogin = false
    
    static var user : CSUser? = nil
    static let userOnceToken = NSUUID().uuidString
    static func share() -> (CSUser) {
        DispatchQueue.once(token: userOnceToken) {
            user = CSUser()
        }
        return user!
    }
    
}


extension CSUser {
    
    //MARK: ### 更新用户信息 ###
    static func updateUserInfo(userInfo: CSUserInfoModel) ->() {
        
        CSUser.share().customer = userInfo.customer
        CSUser.share().tokenInfo = userInfo.token
        CSUser.share().token = userInfo.token.token
        CSUser.saveUserInfo()
        
    }
    
    //MARK: ### 更新token ###
    static func updateToken(token: String) ->() {
    
        CSUser.share().token = token
        CSUser.saveUserInfo()
        
    }
    
    //MARK: ### 保存用户信息 ###
    static func saveUserInfo() {
        
        let cacheData = CSUser.share().toJSONString()?.data(using: String.Encoding.utf8)
        let cacheModel = CSCacheModel()
        cacheModel.cacheData = cacheData
        CSRealmManager.save(model: cacheModel)
        
        let cacheString = String(data: cacheData ?? Data(), encoding: String.Encoding.utf8)
        print("\(String(describing: cacheString))")
        
    }
    
}



