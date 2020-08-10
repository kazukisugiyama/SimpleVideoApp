//
//  FirebaseStorageService.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/09.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage

protocol FirebaseStorageServiceProtocol {
    func downLoadVideo(fileName: String)
    func displayStorageAllVideo(succes: @escaping (_ item: String) -> Void)
}

class FirebaseStorageService {
    
    private let url = "gs://simplevideoapp-17ce7.appspot.com"
    private let url2 = "gs://simplevideoapp-17ce7.appspot.com/"
    
    func downLoadForFirebaseStorage(fileName: String) {
        // Storageは1箇所に集約されるので固定値で問題ない想定
        let videoRef = Storage.storage().reference(forURL: url).child(fileName)
        videoRef.getData(maxSize: INT64_MAX) { (data, error) in
            if let error = error {
                print("getData error: \(error)")
            } else {
                // Documentsディレクトリは1つしかないので0指定でOK
                let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
                let filePath = path + "/" + fileName
                print("filePath: \(filePath)")
                do {
                    try data?.write(to: URL(fileURLWithPath: filePath))
                } catch {
                    print("write error")
                }
            }
        }
    }
    
    func tes2() {
        let ref = Storage.storage().reference(forURL: url)
        ref.listAll { (result, error) in
            if let error = error {
                print("listAll error: \(error)")
            } else {
                var datas: [String] = []
                let items = result.items
                for item in items {
                    var data = item.description
                    guard let range2 = self.url2.range(of: self.url2) else { return }
                    data.replaceSubrange(range2, with: "")
                    datas.append(data)
                }
                print("datas : \(datas)")
            }
        }
    }

}

extension FirebaseStorageService: FirebaseStorageServiceProtocol {
    func downLoadVideo(fileName: String) {
        downLoadForFirebaseStorage(fileName: fileName)
    }
    
    func displayStorageAllVideo(succes: @escaping (_ item: String) -> Void) {
        let ref = Storage.storage().reference(forURL: self.url)
        ref.listAll { (result, error) in
            if let error = error {
                print("listAll error: \(error)")
            } else {
                let items = result.items
                print("items : \(items)")
                for item in items {
                    var data = item.description
                    guard let range2 = self.url2.range(of: self.url2) else { return }
                    data.replaceSubrange(range2, with: "")
                    succes(data)
                }
            }
        }
    }
}
