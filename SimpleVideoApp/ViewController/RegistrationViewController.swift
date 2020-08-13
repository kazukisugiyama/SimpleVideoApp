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
    func showCompleteLabel()
}

// MARK: - class

class RegistrationViewController: BaseViewController {
    
    var presenter: RegistrationPresenterProtocol?

    @IBOutlet weak var mailInputView: CustomInputPartsView!
    @IBOutlet weak var passwordInputView: CustomInputPartsView!
    @IBOutlet weak var passwordConfirmationView: CustomInputPartsView!
    @IBOutlet weak var completeRegistrationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = RegistrationPresenter(view: self)
        completeRegistrationLabel.isHidden = true
    }
    
    @IBAction func actionRegister(_ sender: Any) {
        guard let mail = mailInputView.inputTextField.text,
            let password = passwordInputView.inputTextField.text else { return }
        
        let succes = { () -> Void in
            self.presenter = RegistrationPresenter(view: self)
            self.presenter?.doLogin(mail: mail, password: password)
        }
        mailInputView.actionCheckInputParts(succes: succes)
        passwordInputView.actionCheckInputParts(succes: succes)
        passwordConfirmationView.actionCheckInputParts(succes: succes)
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        let storyboard = R.storyboard.login()
        showStoryBoard(storyboard)
    }
    
}

// MARK: - extension

extension RegistrationViewController: RegistrationViewControllerProtocol {    
    func showCompleteLabel() {
        completeRegistrationLabel.isHidden = false
    }
}
