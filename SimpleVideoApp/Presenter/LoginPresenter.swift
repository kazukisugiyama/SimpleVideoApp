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
    func doPasswordReissue()
}

// MARK: - class

class LoginPresenter: CommonPresenter {
    var firebaseService: FirebaseServiceProtocol?
    var viewController: LoginViewControllerProtocol?
    
    // TODO: 書き方
    override init() {
        firebaseService = FirebaseService()
        viewController = LoginViewController()
    }
}

// MARK: - extension

extension LoginPresenter: LoginPresenterProtocol {
    func doLogin(mail: String, password: String) {
        print("pr doLogin")
        let succes = { () -> Void in
            print("pr succes")
            self.viewController?.showPurchasedVideo()
        }
        
        let error = { () -> Void in
            print("pr succes")
            self.viewController?.indicationUnregisteredError()
        }
        
        firebaseService?.signIn(email: mail, password: password, succes: succes, error: error)
    }
    
    func doPasswordReissue() {
        print("pr doPasswordReissue")
        self.viewController?.showPasswordReissue()
    }
}
