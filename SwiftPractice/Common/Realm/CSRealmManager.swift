//
//  CSRealmManager.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/11.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit
import RealmSwift

class CSRealmManager  {

    static let defaultRealm = try! Realm()
    
    //数据迁移配置
    //当数据模型属性改变，需要迁移数据时，只需要将schemaVersion: 0和oldSchemaVersion < 0中的数字+1即可。当然设置更大也行，但是不允许比之前的版本号小。
    static func realmConfig(version: UInt64) {
        
        let  config = Realm.Configuration(
            schemaVersion: version,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < version) {}
        })
        
        Realm.Configuration.defaultConfiguration = config
        
    }
    
}

//MARK: ### 增删改查 ###
extension CSRealmManager {
    
    //泛型
    class func save <T> (model: T){
        CSRealmManager.update(modelClass: T.self as! Object.Type, newModel: model as! Object)
    }
    
    class func insert(model: Object){
        do {
            try defaultRealm.write {
                defaultRealm.add(model)
            }
        } catch {}
    }
    
    class func delete(model: Object) {
        do {
            try defaultRealm.write {
                defaultRealm.delete(model)
            }
        } catch {}
    }
    
    class func delete(models: Results<Object>) {
        do {
            try defaultRealm.write {
                defaultRealm.delete(models)
            }
        } catch {}
    }
    
    class func update(modelClass: Object.Type, newModel: Object) {
        let results = CSRealmManager.query(modelClass: modelClass)
        if results.count > 0 {
            CSRealmManager.delete(models: results)
        }
        CSRealmManager.insert(model: newModel)
    }

    class func query(modelClass: Object.Type) -> Results<Object> {
        return defaultRealm.objects(modelClass)
    }
    
}
