//
//  RegistrationPresenter.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/09.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit

// MARK: - protocol

protocol RegistrationPresenterProtocol: CommonPresenterProtocol {
    func doLogin(mail: String, password: String)
}

// MARK: - class

class RegistrationPresenter: CommonPresenter {
    var firebaseService: FirebaseServiceProtocol?
    var viewController: RegistrationViewControllerProtocol?
    
    // TODO: 書き方
    override init() {
        firebaseService = FirebaseService()
        viewController = RegistrationViewController()
    }
    
}

// MARK: - extension

extension RegistrationPresenter: RegistrationPresenterProtocol {
    func doLogin(mail: String, password: String) {
        NSLog("doLogin pr")
        let succes = { () -> Void in
            self.viewController?.showLogin()
        }
        
        firebaseService?.memberRegistration(email: mail, password: password, succes: succes)
    }
}
