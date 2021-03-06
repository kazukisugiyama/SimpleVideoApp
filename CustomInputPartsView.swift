//
//  CustomInputPartsView.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/08.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit

// MARK: - protocol

protocol CustomInputPartsViewDelegate: AnyObject {
    func actionCheckInputParts(succes: @escaping () -> Void)
    func indicationError()
}

// MARK: - class

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
            inputTextField.placeholder = Constant.PLACEHOLDER_TEXT_MAIL
            errorLabel.text = Constant.ERROR_TEXT_BLANK_MAIL
        case .password:
            inputTextField.placeholder = Constant.PLACEHOLDER_TEXT_PASSWORD
            inputTextField.isSecureTextEntry = true
            errorLabel.text = Constant.ERROR_TEXT_BLANK_PASSWORD
        case .passwordConfirmation:
            inputTextField.placeholder = Constant.PLACEHOLDER_TEXT_PASSWORD_CONFIRMATION
            inputTextField.isSecureTextEntry = true
            errorLabel.text = Constant.ERROR_TEXT_BLANK_PASSWORD
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
            errorLabel.text = Constant.ERROR_TEXT_UNREGISTERED_MAIL
        case .password:
            errorLabel.isHidden = false
            errorLabel.text = Constant.ERROR_TEXT_UNREGISTERED_PASSWORD
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
