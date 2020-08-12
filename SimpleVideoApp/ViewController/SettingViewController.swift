//
//  SettingViewController.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/04.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit

// MARK: - class

class SettingViewController: BaseViewController {

    let entity = WiFiSettingEntity()
    
    @IBOutlet weak var header: CustomNavigationBarView!
    @IBOutlet weak var streamingSettingSwitch: UISwitch!
    @IBOutlet weak var downloadSettingSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        header.delegate = self
        readSettingForRealm()
    }
    
    @IBAction func actionLogout(_ sender: Any) {
        FirebaseService.shared.signOut()
        showLogin()
    }
    
    @IBAction func actionIsWiFiOnlyStreaming(_ sender: UISwitch) {
        entity.writeStreamSetting(isValid: sender.isOn)
    }
    
    @IBAction func actionIsWiFiOnlyDownload(_ sender: UISwitch) {
        entity.writeDownloadSetting(isValid: sender.isOn)
    }
    
    private func readSettingForRealm() {
        let succes = { (isStreamOnly: Bool, isDownloadOnly: Bool) -> Void in
            self.streamingSettingSwitch.isOn = isStreamOnly
            self.downloadSettingSwitch.isOn = isDownloadOnly
        }
        // initは初期表示時のみ動作（Realmオブジェクトの追加を行う）
        entity.initEntity()
        entity.readEntity(succes: succes)
    }
    
    private func showLogin() {
        let storyboard = R.storyboard.login()
        showStoryBoard(storyboard)
    }
    
    private func showPurchasedVideo() {
        let storyboard = R.storyboard.purchasedVideoBase()
        showStoryBoard(storyboard)
    }
}

// MARK: - extension

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
