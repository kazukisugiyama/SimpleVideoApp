//
//  SlideMenuViewController.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/06.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit

class SlideMenuViewController: BaseViewController {
    private enum ViewControllerType {
        case purchasedVideo
        case downloadedVideo
        case myList
    }

    @IBOutlet weak var slideMenuView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
// MARK: - IBAction
    
    @IBAction func actionPurchasedVideo(_ sender: Any) {
        guard !isShow(type: .purchasedVideo) else {
            closeSlideMenu()
            return
        }
        //showPurchasedVideo()
    }
    
    @IBAction func actionDownLoadedVideo(_ sender: Any) {
        guard !isShow(type: .downloadedVideo) else {
            closeSlideMenu()
            return
        }
        showDownloadedVideo()
    }
    
    @IBAction func actionMyList(_ sender: Any) {
        guard !isShow(type: .myList) else {
            closeSlideMenu()
            return
        }
        showMyList()
    }
    
    @IBAction func actionSearch(_ sender: Any) {
        showSearchVideo()
    }
    
    @IBAction func actionSetting(_ sender: Any) {
        showSetting()
    }
    
// MARK: - private method
    
    private func showDownloadedVideo() {
        let storyboard = R.storyboard.downloadedVideoBase()
        showStoryBoard(storyboard)
    }
    
    private func showMyList() {
        let storyboard = R.storyboard.myListBase()
        showStoryBoard(storyboard)
    }
    
    private func showSearchVideo() {
        let storyboard = R.storyboard.searchVideo()
        showStoryBoard(storyboard)
    }
    
    private func showSetting() {
        let storyboard = R.storyboard.setting()
        showStoryBoard(storyboard)
    }
    
    private func closeSlideMenu() {
        guard let slideMenuController = slideMenuController() else { return }
        slideMenuController.closeLeft()
    }
    
    private func isShow(type: ViewControllerType) -> Bool {
        guard let mainViewController = slideMenuController()?.mainViewController else { return false }
        
        switch mainViewController {
        case is PurchasedVideoViewController:
            return type == ViewControllerType.purchasedVideo
        case is DownloadedVideoViewController:
            return type == ViewControllerType.downloadedVideo
        case is MyListViewController:
            return type == ViewControllerType.myList
        default: return false
        }
    }
    
    
    
}
