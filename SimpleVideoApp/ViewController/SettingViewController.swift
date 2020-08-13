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

    private var presenter: SettingPresenterProtocol?
    
    @IBOutlet weak var header: CustomNavigationBarView!
    @IBOutlet weak var streamingSettingSwitch: UISwitch!
    @IBOutlet weak var downloadSettingSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SettingPresenter()
        header.delegate = self
        readSettingForRealm()
    }
    
    @IBAction func actionLogout(_ sender: Any) {
        let succes = { () -> Void in
            let storyboard = R.storyboard.login()
            self.showStoryBoard(storyboard)
        }
        presenter?.doSignOut(succes: succes)
    }
    
    @IBAction func actionIsWiFiOnlyStreaming(_ sender: UISwitch) {
        presenter?.doUpdateStreamSetting(isValid: sender.isOn)
    }
    
    @IBAction func actionIsWiFiOnlyDownload(_ sender: UISwitch) {
        presenter?.doUpdateDownloadSetting(isValid: sender.isOn)
    }
    
    private func readSettingForRealm() {
        let succes = { (isStreamOnly: Bool, isDownloadOnly: Bool) -> Void in
            self.streamingSettingSwitch.isOn = isStreamOnly
            self.downloadSettingSwitch.isOn = isDownloadOnly
        }
        presenter?.doReadSetting(succes: succes)
    }
}

// MARK: - extension

extension SettingViewController: CustomNavigationBarViewDelegate {
    func actionLeftButton() {
        let storyboard = R.storyboard.purchasedVideoBase()
        showStoryBoard(storyboard)
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
