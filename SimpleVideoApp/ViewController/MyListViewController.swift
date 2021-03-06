//
//  MyListViewController.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/06.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit

// MARK: - class

class MyListViewController: BaseViewController {
    
    @IBOutlet weak var header: CustomNavigationBarView!

    override func viewDidLoad() {
        super.viewDidLoad()
        header.delegate = self
    }

}

// MARK: - extension

extension MyListViewController: CustomNavigationBarViewDelegate {
    func actionLeftButton() {
        // メニューボタン表示
        slideMenuController()?.openLeft()
    }
    
    func actionRightButton1() {
        // 処理なし
        return
    }
    
    func actionRightButton2() {
        // TODO: 更新ボタン
    }
}
