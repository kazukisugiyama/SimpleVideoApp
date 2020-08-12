//
//  CustomInputPartsView.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/08.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit

protocol CustomInputPartsViewDelegate: AnyObject {
    func actionCheckInputParts(succes: @escaping () -> Void)
    func indicationError()
}

class CustomInputPartsView: BaseView {
    private enum InputType: Int {
        case mail
        case password
        case passwordConfirmation
    }
    
    @IBInspectable var type: Int {
        get {
            return inputType.rawValue
        }
        set(inpuTypeIndex) {
            inputType = InputType(rawValue: inpuTypeIndex) ?? .mail
            updateView()
        }
    }
    
    weak var delegate: CustomInputPartsViewDelegate?
    private var inputType: InputType = .mail
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func initView() {
        super.initView()
    }
    
// MARK: - private method
    
    private func updateView() {
        errorLabel.isHidden = true
        
        switch inputType {
        case .mail:
            inputTextField.placeholder = "メールアドレス"
            errorLabel.text = "メールアドレスが入力されていません"
        case .password:
            inputTextField.placeholder = "パスワード"
            errorLabel.text = "パスワードが入力されていません"
        case .passwordConfirmation:
            inputTextField.placeholder = "パスワード確認"
            errorLabel.text = "パスワードが入力されていません"
        }
    }
    
    private func checkTextField(succes: @escaping () -> Void) {
        if inputTextField.text == "" {
            errorLabel.isHidden = false
        } else {
            errorLabel.isHidden = true
            succes()
        }
    }
    
    private func updateErrorLabel() {
        switch inputType {
        case .mail:
            errorLabel.isHidden = false
            errorLabel.text = "入力されたメールアドレスは登録されていません"
        case .password:
            errorLabel.isHidden = false
            errorLabel.text = "入力されたパスワードは登録されていません"
        case .passwordConfirmation:
            break
        }
    }
    
}

// MARK: - extension

extension CustomInputPartsView: CustomInputPartsViewDelegate {
    func actionCheckInputParts(succes: @escaping () -> Void) {
        checkTextField(succes: succes)
    }
    
    func indicationError() {
        updateErrorLabel()
    }
}
