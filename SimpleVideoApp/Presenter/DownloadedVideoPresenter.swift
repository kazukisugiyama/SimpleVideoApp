
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
}

// MARK: - class

class DownloadedVideoPresenter: CommonPresenter {
    var model: DownloadedVideoModelProtocol?
    
    // TODO: ここでインスタンス化すべきじゃない
    override init() {
        model = DownloadedVideoModel()
    }
}

// MARK: - extension

extension DownloadedVideoPresenter: DownloadedVideoPresenterProtocol {
    func displayAllVideo() {
        print("displayAllVideo")
        model?.downLoadVideo()
    }
}
