//
//  RegistrationViewController.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/08.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import Firebase
import UIKit
import Rswift

// MARK: - protocol

protocol RegistrationViewControllerProtocol: BaseViewProtocol {
    func showLogin()
}

// MARK: - class

class RegistrationViewController: BaseViewController {
    
    var presenter: LoginPresenterProtocol?

    @IBOutlet weak var mailInputView: CustomInputPartsView!
    @IBOutlet weak var passwordInputView: CustomInputPartsView!
    @IBOutlet weak var passwordConfirmationView: CustomInputPartsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionRegister(_ sender: Any) {
        guard let mail = mailInputView.inputTextField.text,
            let password = passwordInputView.inputTextField.text,
            let passwordConfirmation = passwordInputView.inputTextField.text else { return }
        
        mailInputView.actionCheckInputParts()
        passwordInputView.actionCheckInputParts()
        passwordConfirmationView.actionCheckInputParts()
        //tes
        showLogin()
        //presenter?.doLogin(email: mail, password: password)
    }
}

// MARK: - extension

extension RegistrationViewController: RegistrationViewControllerProtocol {    
    func showLogin() {
        let storyboard = R.storyboard.login()
        showStoryBoard(storyboard)
    }
}
