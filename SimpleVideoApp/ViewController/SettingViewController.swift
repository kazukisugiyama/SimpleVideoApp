//
//  SettingViewController.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/04.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit

class SettingViewController: BaseViewController {
    
    @IBOutlet weak var header: CustomNavigationBarView!

    override func viewDidLoad() {
        super.viewDidLoad()
        header.delegate = self
    }
    
    @IBAction func actionLogout(_ sender: Any) {
        // ログアウト状態にして、ログイン画面に遷移させる
        showLogin()
    }
    
    @IBAction func actionIsWiFiOnlyStreaming(_ sender: UISwitch) {
        if sender.isOn {
            // wi-fiの接続状態を検知するメソッドを呼び出す
            // https://dev.classmethod.jp/articles/ios-reachability/
            // ダウンロードを行えるようにする
        } else {
            // ダウンロードを行えないように修正
        }
    }
    
    @IBAction func actionIsWiFiOnlyDownload(_ sender: UISwitch) {
        if sender.isOn {
            // wi-fiの接続状態を検知するメソッドを呼び出す
            // https://dev.classmethod.jp/articles/ios-reachability/
            // ダウンロードを行えるようにする
        } else {
            // ダウンロードを行えないように修正
        }
    }
    
    private func showLogin() {
        let storyboard = R.storyboard.login()
        showStoryBoard(storyboard)
    }
}

extension SettingViewController: CustomNavigationBarViewDelegate {
    func actionLeftButton() {
        // 前画面へ戻る
        showPurchasedVideo()
    }

    func actionRightButton1() {
        // 処理なし
        return
    }
    
    func actionRightButton2() {
        // 処理なし
        return
    }
}
