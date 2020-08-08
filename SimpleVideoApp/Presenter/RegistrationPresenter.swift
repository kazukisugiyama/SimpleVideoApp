//
//  RegistrationPresenter.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/09.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit

protocol RegistrationPresenterProtocol: CommonPresenterProtocol {
    func setViewControllerProtocol(viewController: RegistrationViewControllerProtocol)
    func doLogin(email: String, password: String)
}

class RegistrationPresenter: CommonPresenter {
    var firebaseService: FirebaseServiceProtocol?
    var viewController: RegistrationViewControllerProtocol?
}

extension RegistrationPresenter: RegistrationPresenterProtocol {
    func setViewControllerProtocol(viewController: RegistrationViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func doLogin(email: String, password: String) {
        NSLog("doLogin pr")
        let succes = { () -> Void in
            self.viewController?.showLogin()
        }
        
        firebaseService?.signIn(email: email, password: password, succes: succes)
    }
}
