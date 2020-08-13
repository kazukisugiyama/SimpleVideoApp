//
//  SlideMenuViewController.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/06.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit

// MARK: - class

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
        let storyboard = R.storyboard.purchasedVideoBase()
        showStoryBoard(storyboard)
    }
    
    @IBAction func actionDownLoadedVideo(_ sender: Any) {
        guard !isShow(type: .downloadedVideo) else {
            closeSlideMenu()
            return
        }
        let storyboard = R.storyboard.downloadedVideoBase()
        showStoryBoard(storyboard)
    }
    
    @IBAction func actionMyList(_ sender: Any) {
        guard !isShow(type: .myList) else {
            closeSlideMenu()
            return
        }
        let storyboard = R.storyboard.myListBase()
        showStoryBoard(storyboard)
    }
    
    @IBAction func actionSearch(_ sender: Any) {
        let storyboard = R.storyboard.searchVideo()
        showStoryBoard(storyboard)
    }
    
    @IBAction func actionSetting(_ sender: Any) {
        let storyboard = R.storyboard.setting()
        showStoryBoard(storyboard)
    }
    
    // MARK: - private method
    
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
