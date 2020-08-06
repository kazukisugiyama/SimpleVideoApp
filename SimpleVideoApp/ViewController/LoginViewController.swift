//
//  ViewController.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/04.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit
import Rswift

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var warningMailLabel: UILabel!
    @IBOutlet weak var warningPasswordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLabel()
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        checkTextField(mail: mailTextField.text, password: passwordTextField.text)
        // サーバへ通信する
        // 結果がOKであればつPurchasedVideoに遷移
        showPurchasedVideo()
    }
    
    @IBAction func actionReissue(_ sender: Any) {
        // パスワード再発行画面へ遷移
    }
    
    private func initLabel() {
        warningMailLabel.isHidden = true
        warningPasswordLabel.isHidden = true
    }
    
    private func checkTextField(mail: String?, password: String?) {
        guard let mail = mail, let password = password else {
            return
        }
        
        if mail == "" {
            warningMailLabel.isHidden = false
            warningMailLabel.text = "アドレスが未入力です"
        } else {
            warningMailLabel.isHidden = true
        }
        if password == "" {
            warningPasswordLabel.isHidden = false
            warningPasswordLabel.text = "パスワードが未入力です"
        } else {
            warningPasswordLabel.isHidden = true
        }
        //登録されていないアドレス、パスワードの場合エラーを返す
    }
    
}

