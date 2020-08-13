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
    var viewController: RegistrationViewControllerProtocol?
    
    init(view: RegistrationViewController) {
        self.viewController = view
    }
}

// MARK: - extension

extension RegistrationPresenter: RegistrationPresenterProtocol {
    func doLogin(mail: String, password: String) {
        let succes = { () -> Void in
            self.viewController?.showCompleteLabel()
        }
        
        FirebaseService.shared.memberRegistration(email: mail, password: password, succes: succes)
    }
}
