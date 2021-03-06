//
//  SearchVideoViewController.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/04.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit

// MARK: - class

class SearchVideoViewController: BaseViewController {
    
    @IBOutlet weak var header: CustomNavigationBarView!

    override func viewDidLoad() {
        super.viewDidLoad()
        header.delegate = self
    }
    
}

// MARK: - extension

extension SearchVideoViewController: CustomNavigationBarViewDelegate {
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
