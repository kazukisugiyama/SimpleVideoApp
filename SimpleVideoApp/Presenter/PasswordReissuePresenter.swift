//
//  PasswordReissuePresenter.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/09.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit

protocol PasswordReissuePresenterProtocol: CommonPresenterProtocol {
    func setViewControllerProtocol(viewController: PasswordReissueViewControllerProtocol)
    func doReset(email: String)
}

class PasswordReissuePresenter: CommonPresenter {
    var firebaseService: FirebaseServiceProtocol?
    var viewController: PasswordReissueViewControllerProtocol?
}

extension PasswordReissuePresenter: PasswordReissuePresenterProtocol {
    func setViewControllerProtocol(viewController: PasswordReissueViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func doReset(email: String) {
        NSLog("doLogin pr")
        let succes = { () -> Void in
            self.viewController?.sendCompletely()
        }
        
        firebaseService?.passwordReset(email: email, succes: succes)
    }
}

