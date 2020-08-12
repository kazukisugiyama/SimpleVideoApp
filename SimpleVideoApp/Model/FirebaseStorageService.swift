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
    static let shared = FirebaseStorageService()
    private init() {}
}

extension FirebaseStorageService: FirebaseStorageServiceProtocol {
    func downLoadVideo(fileName: String) {
        // Storageは1箇所に集約されるので固定値で問題ない想定
        let videoRef = Storage.storage().reference(forURL: Constant.STORAGE_URL).child(fileName)
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
    
    func displayStorageAllVideo(succes: @escaping (_ item: String) -> Void) {
        let ref = Storage.storage().reference(forURL: Constant.STORAGE_URL)
        ref.listAll { (result, error) in
            if let error = error {
                print("listAll error: \(error)")
            } else {
                let items = result.items
                print("items : \(items)")
                for item in items {
                    var data = item.description
                    guard let range2 = Constant.STORAGE_URL_ADD_SLASH.range(of: Constant.STORAGE_URL_ADD_SLASH) else { return }
                    data.replaceSubrange(range2, with: "")
                    succes(data)
                }
            }
        }
    }
}
