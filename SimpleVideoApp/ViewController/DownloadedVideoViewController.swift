//
//  DownloadedVideoTableViewController.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/06.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import SlideMenuControllerSwift
import UIKit

class DownloadedVideoViewController: BaseViewController {

    @IBOutlet weak var header: CustomNavigationBarView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        header.delegate = self
    }
}

extension DownloadedVideoViewController: CustomNavigationBarViewDelegate {
    func actionLeftButton() {
        // メニューボタン表示
        slideMenuController()?.openLeft()
    }
    
    func actionRightButton1() {
        // 処理なし
        return
    }
    
    func actionRightButton2() {
        // 更新ボタン
    }
}
