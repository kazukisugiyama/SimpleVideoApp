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
        // TODO: LoginViewController参照
        presenter = PasswordReissuePresenter()
    }
    
    @IBAction func actionPasswordReissue(_ sender: Any) {
        guard let mail = mailInputView.inputTextField.text else { return }
        
        mailInputView.actionCheckInputParts()
        completedLabel.isHidden = false
        
        presenter?.doReset(mail: mail)
    }
    
}

// MARK: - extension

extension PasswordReissueViewController: PasswordReissueViewControllerProtocol {
    func sendCompletely() {
        completedLabel.isHidden = false
    }
}
