//
//  SettingViewController.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/04.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit
import Reachability

class SettingViewController: BaseViewController {
    
    let entity = WiFiSettingEntity()
    
    @IBOutlet weak var header: CustomNavigationBarView!
    @IBOutlet weak var streamingSettingSwitch: UISwitch!
    @IBOutlet weak var downloadSettingSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        header.delegate = self
        streamingSettingSwitch.isOn = entity.streamWiFiOnly
        downloadSettingSwitch.isOn = entity.downloadWiFiOnly
    }
    
    @IBAction func actionLogout(_ sender: Any) {
        // ログアウト状態にして、ログイン画面に遷移させる
        showLogin()
    }
    
    @IBAction func actionIsWiFiOnlyStreaming(_ sender: UISwitch) {
        print("stream isOn : \(sender.isOn)")
        entity.writeStreamSetting(isValid: sender.isOn)
        print("stream entity : \(entity.streamWiFiOnly)")
    }
    
    @IBAction func actionIsWiFiOnlyDownload(_ sender: UISwitch) {
        print("download isOn : \(sender.isOn)")
        entity.writeDownloadSetting(isValid: sender.isOn)
        print("stream entity : \(entity.downloadWiFiOnly)")
    }
    
    private func showLogin() {
        let storyboard = R.storyboard.login()
        showStoryBoard(storyboard)
    }
    
    private func showPurchasedVideo() {
        let storyboard = R.storyboard.purchasedVideo()
        showStoryBoard(storyboard)
    }
}

extension SettingViewController: CustomNavigationBarViewDelegate {
    func actionLeftButton() {
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
