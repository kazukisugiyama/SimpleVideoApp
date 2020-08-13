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
    func doReset(mail: String)
    func doPasswordReset(mail: String)
}

// MARK: - class

class PasswordReissuePresenter: CommonPresenter {
    weak var viewController: PasswordReissueViewControllerProtocol?
    
    init(view: PasswordReissueViewController) {
        self.viewController = view
    }
}

// MARK: - extension

extension PasswordReissuePresenter: PasswordReissuePresenterProtocol {
    func doReset(mail: String) {
        let succes = { () -> Void in
            self.viewController?.sendCompletely()
        }
        
        FirebaseService.shared.passwordReset(email: mail, succes: succes)
    }
    
    func doPasswordReset(mail: String) {
        let succesPasswrdReset = { () -> Void in
            self.viewController?.sendCompletely()
        }
        FirebaseService.shared.passwordReset(email: mail, succes: succesPasswrdReset)
    }
}

