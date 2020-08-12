//
//  VideoInfoEntity.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/11.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import Foundation
import RealmSwift

class VideoInfoEntity: Object {
    @objc dynamic var videoTitle = ""
    @objc dynamic var purchaseDate: Date? = nil
    override static func primaryKey() -> String? {
        return "videoTitle"
    }
    
    func addVideoInfoEntity(title: String, date: Date) {
        do {
            let realm = try Realm()
            // タイトルを主キーにし、同じタイトルが存在した場合はDBに追加を行わない
            if realm.object(ofType: VideoInfoEntity.self, forPrimaryKey: title) == nil {
                let entity = VideoInfoEntity()
                entity.videoTitle = title
                entity.purchaseDate = date
                try realm.write {
                    realm.add(entity)
                    print("VideoInfoEntity object add.")
                }
            }
        } catch {
            fatalError("writeDownloadSetting update error.")
        }
    }
    
    func readVideoInfoEntity(succes: @escaping (_ titles: [String]) -> Void) {
        do {
            let realm = try Realm()
            let objs = realm.objects(VideoInfoEntity.self)
            var titles: [String] = []
            for obj in objs {
                titles.append(obj.videoTitle)
            }
            succes(titles)
        } catch {
            fatalError("realm read error.")
        }
    }
    
}
