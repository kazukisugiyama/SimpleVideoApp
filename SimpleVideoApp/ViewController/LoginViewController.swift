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
    func indicationUnregisteredError()
}

// MARK: - class

class LoginViewController: BaseViewController {
    
    var presenter: LoginPresenterProtocol?
    var firebaseService: FirebaseServiceProtocol?
    
    @IBOutlet weak var mailInputView: CustomInputPartsView!
    @IBOutlet weak var passwordInputView: CustomInputPartsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        guard let mail = mailInputView.inputTextField.text,
            let password = passwordInputView.inputTextField.text else { return }
        
        let succes = { () -> Void in
            print("succes clouser")
            self.doLogin(mail: mail, password: password)
        }
        mailInputView.actionCheckInputParts(succes: succes)
        passwordInputView.actionCheckInputParts(succes: succes)
    }
    
    private func doLogin(mail: String, password: String) {
        let succes = { () -> Void in
            self.showPurchasedVideo()
        }
        let error = { () -> Void in
            self.indicationUnregisteredError()
        }
        
        firebaseService = FirebaseService()
        firebaseService?.signIn(email: mail, password: password, succes: succes, error: error)
    }
    
    @IBAction func actionReissue(_ sender: Any) {
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
    
    func indicationUnregisteredError() {
        // TODO: このタイミングでCustomViewを呼び出すとFatalError
        print("error")
    }
}
