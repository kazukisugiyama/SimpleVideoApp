//
//  PurchasedVideo.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/04.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import Foundation
import FirebaseStorage

// MARK: - protocol

protocol PurchasedVideoPresenterProtocol: CommonPresenterProtocol {
    func doDisplayStorageAllVideo(succes: @escaping (_ item: String) -> Void)
}

// MARK: - class

class PurchasedVideoPresenter: CommonPresenter {}

// MARK: - extension

extension PurchasedVideoPresenter: PurchasedVideoPresenterProtocol {
    func doDisplayStorageAllVideo(succes: @escaping (_ item: String) -> Void) {
        FirebaseStorageService.shared.displayStorageAllVideo(succes: succes)
    }
}
