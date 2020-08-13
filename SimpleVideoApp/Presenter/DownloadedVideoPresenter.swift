
//
//  DownloadedVideo.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/04.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit

// MARK: - protocol

protocol DownloadedVideoPresenterProtocol: CommonPresenterProtocol {
    func displayAllVideo()
    func doReadVideoInfo(succes: @escaping (_ item: [String]) -> Void)
}

// MARK: - class

class DownloadedVideoPresenter: CommonPresenter {
    let entity: VideoInfoEntity
    var model: DownloadedVideoModelProtocol?
    
    override init() {
        entity = VideoInfoEntity()
    }
}

// MARK: - extension

extension DownloadedVideoPresenter: DownloadedVideoPresenterProtocol {
    func doReadVideoInfo(succes: @escaping ([String]) -> Void) {
        entity.readVideoInfoEntity(succes: succes)
    }
    
    func displayAllVideo() {
        model?.downLoadVideo()
    }
}
