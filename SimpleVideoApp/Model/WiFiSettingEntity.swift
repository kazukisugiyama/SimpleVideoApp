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
    @objc dynamic var streamWiFiOnly = Bool()
    @objc dynamic var downloadWiFiOnly = Bool()
    
    func writeStreamSetting(isValid: Bool) {
        do {
            let realm = try Realm()
            try realm.write {
                self.streamWiFiOnly = isValid
                print("self.streamWiFiOnly : \(self.streamWiFiOnly)")
            }
        } catch {
            fatalError("writeStreamSetting update error.")
        }
    }
    
    func writeDownloadSetting(isValid: Bool) {
        do {
            let realm = try Realm()
            try realm.write {
                self.downloadWiFiOnly = isValid
                print("self.downloadWiFiOnly : \(self.downloadWiFiOnly)")
            }
        } catch {
            fatalError("writeDownloadSetting update error.")
        }
    }
}
