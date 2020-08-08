//
//  LoginView.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/05.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit

protocol LoginPresenterProtocol: CommonPresenterProtocol {
    func setViewControllerProtocol(viewController: LoginViewControllerProtocol)
    func doLogin(email: String, password: String)
    func doPasswordReissue()
}

class LoginPresenter: CommonPresenter {
    var firebaseService: FirebaseServiceProtocol?
    var viewController: LoginViewControllerProtocol?
}

extension LoginPresenter: LoginPresenterProtocol {
    func setViewControllerProtocol(viewController: LoginViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func doLogin(email: String, password: String) {
        NSLog("doLogin pr")
        let succes = { () -> Void in
            self.viewController?.showPurchasedVideo()
        }
        
        firebaseService?.signIn(email: email, password: password, succes: succes)
    }
    
    func doPasswordReissue() {
        self.viewController?.showPasswordReissue()
    }
}
