//
//  DownloadedVideoModel.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/04.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import Foundation

protocol DownloadedVideoModelProtocol {
    func downLoadVideo()
}

class DownloadedVideoModel {
    func searchVideoList() {
        print("searchVideoList")
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        do {
            let content = try FileManager.default.contentsOfDirectory(atPath: path)
            print("content : \(String(describing: content))")
        } catch {
            print("error")
        }
    }
}

extension DownloadedVideoModel: DownloadedVideoModelProtocol {
    func downLoadVideo() {
        searchVideoList()
    }
}

