//
//  SettingEntity.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/11.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import Foundation
import RealmSwift

class WiFiSettingEntity: Object {
    @objc dynamic var id = 0
    @objc dynamic var streamWiFiOnly = false
    @objc dynamic var downloadWiFiOnly = false
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func initEntity() {
        do {
            let realm = try! Realm()
            // 既にRelmオブジェクトが生成されていた場合オブジェクトの追加を行わない
            if realm.object(ofType: WiFiSettingEntity.self, forPrimaryKey: 1) == nil {
                let entity = WiFiSettingEntity()
                entity.id = 1
                entity.streamWiFiOnly = false
                entity.downloadWiFiOnly = false
                try realm.write {
                    realm.add(entity)
                    print("WiFiSettingEntity object add.")
                }
            }
        } catch {
            fatalError("realm add error.")
        }
    }
    
    func readEntity(succes: @escaping (_ isStreamOnly: Bool, _ isDownloadOnly: Bool) -> Void) {
        do {
            let realm = try Realm()
            let objs = realm.objects(WiFiSettingEntity.self)
            if let obj = objs.last {
                succes(obj.streamWiFiOnly, obj.downloadWiFiOnly)
            }
        } catch {
            fatalError("realm read error.")
        }
    }
    
    func writeStreamSetting(isValid: Bool) {
        do {
            let realm = try Realm()
            let objs = realm.objects(WiFiSettingEntity.self)
            if let obj = objs.last {
                try realm.write {
                    obj.streamWiFiOnly = isValid
                }
            }
        } catch {
            fatalError("realm update error.")
        }
    }
    
    func writeDownloadSetting(isValid: Bool) {
        do {
            let realm = try Realm()
            let objs = realm.objects(WiFiSettingEntity.self)
            if let obj = objs.last {
                try realm.write {
                    obj.downloadWiFiOnly = isValid
                }
            }
        } catch {
            fatalError("realm update error.")
        }
    }
    
}
