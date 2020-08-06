//
//  MyListBaseViewController.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/06.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import SlideMenuControllerSwift
import UIKit

class MyListBaseViewController: SlideMenuController {

    override func awakeFromNib() {
        mainViewController = R.storyboard.myList().instantiateInitialViewController()
        leftViewController = R.storyboard.slideMenu().instantiateInitialViewController()

        SlideMenuOptions.hideStatusBar = false
        SlideMenuOptions.contentViewScale = 1
        SlideMenuOptions.leftViewWidth = view.frame.width
        SlideMenuOptions.tapGesturesEnabled = true
        super.awakeFromNib()
    }

}
