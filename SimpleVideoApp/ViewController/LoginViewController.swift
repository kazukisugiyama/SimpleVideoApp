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
    func showPasswordReissue()
}

// MARK: - class

class LoginViewController: BaseViewController {
    
    var presenter: LoginPresenterProtocol?
    
    @IBOutlet weak var mailInputView: CustomInputPartsView!
    @IBOutlet weak var passwordInputView: CustomInputPartsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //presenter?.setViewControllerProtocol(viewController: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        print("actionLogin")

        guard let mail = mailInputView.inputTextField.text,
            let password = passwordInputView.inputTextField.text else { return }
        mailInputView.actionCheckInputParts()
        passwordInputView.actionCheckInputParts()
        presenter?.doLogin(email: mail, password: password)
    }
    
    @IBAction func actionReissue(_ sender: Any) {
        // パスワード再発行画面へ遷移
        presenter?.doPasswordReissue()
        
        //TODO: tes
        showPasswordReissue()
    }
    
}

// MARK: - extension

extension LoginViewController: LoginViewControllerProtocol {
    func showPurchasedVideo() {
        let storyboard = R.storyboard.purchasedVideoBase()
        showStoryBoard(storyboard)
    }
    
    func showPasswordReissue() {
        let storyboard = R.storyboard.passwordReissue()
        showStoryBoard(storyboard)
    }
}
