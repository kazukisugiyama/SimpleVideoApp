//
//  PasswordReissueViewController.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/08.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit

// MARK: - protocol

protocol PasswordReissueViewControllerProtocol: BaseViewProtocol {
    func sendCompletely()
}

// MARK: - class

class PasswordReissueViewController: BaseViewController {
    
    var presenter: PasswordReissuePresenter?
    
    @IBOutlet weak var mailInputView: CustomInputPartsView!
    @IBOutlet weak var completedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        completedLabel.isHidden = true
    }
    
    @IBAction func actionPasswordReissue(_ sender: Any) {
        let succesCheckText = { () -> Void in
            self.passwordReset()
        }
        mailInputView.actionCheckInputParts(succes: succesCheckText)
    }
    
    @IBAction func actionShowLogin(_ sender: Any) {
        showLogin()
    }
    
    private func passwordReset() {
        guard let mail = mailInputView.inputTextField.text else { return }
        
        let succesPasswrdReset = { () -> Void in
            self.sendCompletely()
        }
        FirebaseService.shared.passwordReset(email: mail, succes: succesPasswrdReset)
    }
    
    private func showLogin() {
        let storyboard = R.storyboard.login()
        showStoryBoard(storyboard)
    }
    
}

// MARK: - extension

extension PasswordReissueViewController: PasswordReissueViewControllerProtocol {
    func sendCompletely() {
        completedLabel.isHidden = false
    }
}
