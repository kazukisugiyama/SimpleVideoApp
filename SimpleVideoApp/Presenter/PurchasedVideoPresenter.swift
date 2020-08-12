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
    func displayAllVideo()
}

// MARK: - class

class PurchasedVideoPresenter: CommonPresenter {
    var model: FirebaseStorageServiceProtocol?
    var viewController: PurchasedVideoViewControllerProtocol?
    
    // TODO: ここでインスタンス化すべきじゃない
    override init() {
        //model = FirebaseStorageService()
        viewController = PurchasedVideoViewController() as! PurchasedVideoViewControllerProtocol
    }
}

// MARK: - extension

extension PurchasedVideoPresenter: PurchasedVideoPresenterProtocol {
    func displayAllVideo() {
        /*
        print("displayAllVideo")
        let succes = { (items: [StorageReference]) -> Void in
            print("pr succes")
            self.viewController?.testes(items: items)
        }
        
        model?.tes(succes: succes)
 */
    }
}
