//
//  BaseViewController.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/05.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit

// MARK: - protocol

protocol BaseViewProtocol: AnyObject {
    func closeView()
    func showStoryBoard(_ storyboard: UIKit.UIStoryboard)
    //func showPurchasedVideo()
}

// MARK: - class

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - extension

extension BaseViewController: BaseViewProtocol {
    func closeView() {
        dismiss(animated: true, completion: nil)
    }
    
    func showStoryBoard(_ storyboard: UIKit.UIStoryboard) {
        dismiss(animated: true, completion: nil)

        guard let vc = storyboard.instantiateInitialViewController() else { return }
        vc.modalPresentationStyle = .fullScreen
        // presentの場合rootが遷移時に映るため、rootViewControllerを入れ替えることで画面遷移の動きを実装
        UIApplication.shared.keyWindow?.rootViewController = vc
    }
}
