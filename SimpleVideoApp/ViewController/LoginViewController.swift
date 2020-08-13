//
//  ViewController.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/04.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import Firebase
import UIKit

// MARK: - protocol

protocol LoginViewControllerProtocol: BaseViewProtocol {
    func showPurchasedVideo()
    func indicationUnregisteredError()
}

// MARK: - class

class LoginViewController: BaseViewController {
    
    var presenter: LoginPresenterProtocol?
    
    @IBOutlet weak var mailInputView: CustomInputPartsView!
    @IBOutlet weak var passwordInputView: CustomInputPartsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginPresenter(view: self)
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        guard let mail = mailInputView.inputTextField.text,
            let password = passwordInputView.inputTextField.text else { return }
        
        let succes = { () -> Void in
            self.presenter?.doLogin(mail: mail, password: password)
        }
        mailInputView.actionCheckInputParts(succes: succes)
        passwordInputView.actionCheckInputParts(succes: succes)
    }
    
    @IBAction func actionRegistration(_ sender: Any) {
        let storyboard = R.storyboard.registration()
        showStoryBoard(storyboard)
    }
    
    @IBAction func actionReissue(_ sender: Any) {
        let storyboard = R.storyboard.passwordReissue()
        showStoryBoard(storyboard)
    }
}

// MARK: - extension

extension LoginViewController: LoginViewControllerProtocol {
    func showPurchasedVideo() {
        let storyboard = R.storyboard.purchasedVideoBase()
        showStoryBoard(storyboard)
    }
    
    func indicationUnregisteredError() {
        // TODO: 未実装
        return
    }
}
