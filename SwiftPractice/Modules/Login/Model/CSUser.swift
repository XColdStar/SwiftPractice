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
    
    
    static func updateUserInfo(userInfo: CSUserInfoModel) ->() {
        
        CSUser.share().customer = userInfo.customer
        CSUser.share().tokenInfo = userInfo.tokenInfo
        CSUser.share().token = userInfo.tokenInfo.token
        
    }
    
}
