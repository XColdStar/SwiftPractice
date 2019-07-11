//
//  CSUserInfoModel.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on July 9, 2019

import Foundation
import HandyJSON

class CSUserInfoModel : CSBaseModel , CSBaseModelProtocol {

    var customer : CSUserInfoCustomer!
    var tokenInfo : CSUserInfoToken!
    
    static func jsonToModel(json: String) -> HandyJSON? {
        guard let model = JSONDeserializer<CSUserInfoModel>.deserializeFrom(json: json) else {
            return nil
        }
        return model
    }

}

