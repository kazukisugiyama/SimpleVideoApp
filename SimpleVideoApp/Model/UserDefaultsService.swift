//
//  UserDefaultsService.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/10.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import Foundation

protocol UserDefaultsServiceProtocol {
//    func downLoadVideo(succes: @escaping () -> Void)
}

class UserDefaultsService {
    let userDefaults = UserDefaults.standard
    
    private func tes() {
        //UserDefaults.register(defaults: ["DataStore: "defaults"])
    }
    
}

extension UserDefaultsService: UserDefaultsServiceProtocol {
    
}
