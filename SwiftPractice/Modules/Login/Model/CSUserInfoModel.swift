//
//  CSUserInfoModel.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on July 9, 2019

import Foundation
import HandyJSON

class CSUserInfoModel : CSBaseModel , CSBaseModelProtocol {

    var customer: CSUserInfoCustomer!
    var token: CSUserInfoToken!
    
//    func mapping(mapper: HelpingMapper) {
//        // 指定 token 字段用 "tokenInfo" 去解析
//        mapper.specify(property: &tokenInfo, name: "token")
//    }
    
    static func jsonToModel(json: String) -> HandyJSON? {
        guard let model = JSONDeserializer<CSUserInfoModel>.deserializeFrom(json: json) else {
            return nil
        }
        return model
    }

}

class CSUserInfoToken : CSBaseModel {
    
    var customerid = 0
    var expireTime : String!
    var token : String!
    var updatetime : String!
    
}


class CSUserInfoCustomer : CSBaseModel {
    
    var address : Optional<Any>?
    var birth : String!
    var cdate : String!
    var channelId : Optional<Any>?
    var city : Optional<Any>?
    var country : Optional<Any>?
    var deviceId : Optional<Any>?
    var email : Optional<Any>?
    var hasLocked : Optional<Any>?
    var hasSubscribe : Optional<Any>?
    var id : Int!
    var idcard : Optional<Any>?
    var lockedDate : Optional<Any>?
    var loginDate : Optional<Any>?
    var loginFailureCount : Optional<Any>?
    var loginIp : Optional<Any>?
    var medicalNum : Optional<Any>?
    var memberRank : Optional<Any>?
    var mobile : String!
    var modifier : Optional<Any>?
    var name : String!
    var nickName : Optional<Any>?
    var openId : Optional<Any>?
    var os : Optional<Any>?
    var password : Optional<Any>?
    var phone : String!
    var photo : String!
    var privilege : Optional<Any>?
    var province : Optional<Any>?
    var qrCode : Optional<Any>?
    var qrUrl : Optional<Any>?
    var registerIp : Optional<Any>?
    var returnPrice : Optional<Any>?
    var searchContent : Optional<Any>?
    var sex : Int!
    var token : Optional<Any>?
    var ua : Optional<Any>?
    var udate : String!
    var unionId : Optional<Any>?
    var unsubscribeTime : Optional<Any>?
    var userName : Optional<Any>?
    var version : Optional<Any>?
    var zipCode : Optional<Any>? = nil
    
}
