//
//  LoginView.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/05.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit

// MARK: - protocol

protocol LoginPresenterProtocol: CommonPresenterProtocol {
    func doLogin(mail: String, password: String)
}

// MARK: - class

class LoginPresenter: CommonPresenter {
    private weak var viewController: LoginViewControllerProtocol?
    
    init(view: LoginViewController) {
        self.viewController = view
    }
}

// MARK: - extension

extension LoginPresenter: LoginPresenterProtocol {
    func doLogin(mail: String, password: String) {
        let succes = { () -> Void in
            self.viewController?.showPurchasedVideo()
        }
        
        let error = { () -> Void in
            self.viewController?.indicationUnregisteredError()
        }
        
        FirebaseService.shared.signIn(email: mail, password: password, succes: succes, error: error)
    }
}
