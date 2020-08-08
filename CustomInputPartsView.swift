//
//  CustomInputPartsView.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/08.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit

protocol CustomInputPartsViewDelegate: AnyObject {
    func actionCheckInputParts()
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
    
    private func checkTextField() {
        if inputTextField.text == "" {
            errorLabel.isHidden = false
        } else {
            errorLabel.isHidden = true
        }
    }
}

// MARK: - extension

extension CustomInputPartsView: CustomInputPartsViewDelegate {
    func actionCheckInputParts() {
        checkTextField()
    }
}
