//
//  Setting.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/04.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit

// MARK: - protocol

protocol SettingPresenterProtocol: CommonPresenterProtocol {
    func doSignOut(succes: @escaping () -> Void)
    func doUpdateStreamSetting(isValid: Bool)
    func doUpdateDownloadSetting(isValid: Bool)
    func doReadSetting(succes: @escaping (_ isStreamOnly: Bool, _ isDownloadOnly: Bool) -> Void)
}

// MARK: - class

class SettingPresenter: CommonPresenter {
    let entity: WiFiSettingEntity
    
    override init() {
        entity = WiFiSettingEntity()
    }
}

// MARK: - extension

extension SettingPresenter: SettingPresenterProtocol {
    func doSignOut(succes: @escaping () -> Void) {
        FirebaseService.shared.signOut(succes: succes)
    }
    
    func doUpdateStreamSetting(isValid: Bool) {
        entity.writeStreamSetting(isValid: isValid)
    }
    
    func doUpdateDownloadSetting(isValid: Bool) {
        entity.writeDownloadSetting(isValid: isValid)
    }
    
    func doReadSetting(succes: @escaping (_ isStreamOnly: Bool, _ isDownloadOnly: Bool) -> Void) {
        entity.initEntity()
        entity.readEntity(succes: succes)
    }
    
}
