//
//  PasswordReissuePresenter.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/09.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit

// MARK: - protocol

protocol PasswordReissuePresenterProtocol: CommonPresenterProtocol {
    func setViewControllerProtocol(viewController: PasswordReissueViewControllerProtocol)
    func doReset(mail: String)
}

// MARK: - class

class PasswordReissuePresenter: CommonPresenter {
    var firebaseService: FirebaseServiceProtocol?
    weak var viewController: PasswordReissueViewControllerProtocol?
}

// MARK: - extension

extension PasswordReissuePresenter: PasswordReissuePresenterProtocol {
    func setViewControllerProtocol(viewController: PasswordReissueViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func doReset(mail: String) {
        NSLog("doLogin pr")
        let succes = { () -> Void in
            self.viewController?.sendCompletely()
        }
        
        firebaseService?.passwordReset(email: mail, succes: succes)
    }
}

