//
//  PasswordSettingViewController.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/09.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit

// MARK: - protocol

protocol PasswordResettingViewControllerProtocol: BaseViewProtocol {
    func showLogin()
}

// MARK: - protocol

class PasswordResettingViewController: BaseViewController {
    
    @IBOutlet var passwordInputView: CustomInputPartsView!
    @IBOutlet var passwordConfirmationView: CustomInputPartsView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func actionPasswordAResetting(_ sender: Any) {
        guard let password = passwordInputView.inputTextField.text,
        let passwordConfirmation = passwordConfirmationView.inputTextField.text else { return }
    }
}

// MARK: - extension

extension PasswordResettingViewController: PasswordResettingViewControllerProtocol {
    func showLogin() {
        let storyboard = R.storyboard.login()
        showStoryBoard(storyboard)
    }
}
