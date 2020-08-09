//
//  BaseViewController.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/05.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit

protocol BaseViewProtocol: AnyObject {
    func closeView()
    func showStoryBoard(_ storyboard: UIKit.UIStoryboard)
    //func showPurchasedVideo()
}

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension BaseViewController: BaseViewProtocol {
    func closeView() {
        dismiss(animated: true, completion: nil)
    }
    
    func showStoryBoard(_ storyboard: UIKit.UIStoryboard) {
        dismiss(animated: true, completion: nil)
        if let vc = storyboard.instantiateInitialViewController() {
            vc.modalPresentationStyle = .fullScreen
            guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else { return }
            rootViewController.present(vc, animated: true, completion: nil)
        }
    }
    
    /*
    func showPurchasedVideo() {
        //let storyboard = R.storyboard.purchasedVideoBase()
        let storyboard = R.storyboard.videoPlayer()
        showStoryBoard(storyboard)
    }
 */
}
