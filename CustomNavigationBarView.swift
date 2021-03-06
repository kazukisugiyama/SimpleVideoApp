//
//  CustomNavigationBarView.swift
//  
//
//  Created by 杉山和輝 on 2020/08/05.
//

import UIKit

// MARK: - protocol

protocol CustomNavigationBarViewDelegate: AnyObject {
    func actionLeftButton()
    func actionRightButton1()
    func actionRightButton2()
}

// MARK: - class

class CustomNavigationBarView: BaseView {
    private enum HeaderType: Int {
        case purchased
        case downloaded
        case myList
        case search
        case setting
        case player
    }
    
    @IBInspectable var header: Int {
        get {
            return headerType.rawValue
        }
        set(headerTypeIndex) {
            headerType = HeaderType(rawValue: headerTypeIndex) ?? .purchased
            updateView()
        }
    }
    
    weak var delegate: CustomNavigationBarViewDelegate?
    private var headerType: HeaderType = .purchased
    
    @IBOutlet weak var titleNavigationItem: UINavigationItem!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var leftButton: UIBarButtonItem!
    @IBOutlet weak var rightButton1: UIBarButtonItem!
    @IBOutlet weak var rightButton2: UIBarButtonItem!
    
    override func initView() {
        super.initView()
    }
    
    // MARK: - IBAction
    
    @IBAction func actionLeftButton(_ sender: Any) {
        // メニュー、戻るボタン
        delegate?.actionLeftButton()
    }
    
    @IBAction func actionRightButton1(_ sender: Any) {
        // マイリスト追加ボタン、マイリスト操作ボタン
        delegate?.actionRightButton1()
    }
    
    @IBAction func actionRightButton2(_ sender: Any) {
        // 更新ボタン、リスト名変更、リスト削除ボタン
        delegate?.actionRightButton2()
    }
    
    // MARK: - private method
    
    private func updateView() {
        switch headerType {
        case .purchased:
            titleNavigationItem.title = Constant.TITLE_PURCHASED
            leftButton.isEnabled = true
            leftButton.image = UIImage(systemName: "line.horizontal.3")
            rightButton1.isEnabled = true
            rightButton1.image = UIImage(systemName: "folder.badge.plus")
            rightButton2.isEnabled = true
            rightButton2.image = UIImage(systemName: "arrow.counterclockwise")
        case .downloaded:
            titleNavigationItem.title = Constant.TITLE_DOWNLOADED
            leftButton.isEnabled = true
            leftButton.image = UIImage(systemName: "line.horizontal.3")
            rightButton1.isEnabled = false
            rightButton1.image = UIImage(systemName: "")
            rightButton1.tintColor = UIColor.clear
            rightButton2.isEnabled = true
            rightButton2.image = UIImage(systemName: "arrow.counterclockwise")
        case .myList:
            titleNavigationItem.title = Constant.TITLE_MYLIST
            leftButton.isEnabled = true
            leftButton.image = UIImage(systemName: "line.horizontal.3")
            rightButton1.isEnabled = true
            rightButton1.image = UIImage(systemName: "pencil")
            rightButton2.isEnabled = true
            rightButton2.image = UIImage(systemName: "arrow.counterclockwise")
        case .search:
            titleNavigationItem.title = Constant.TITLE_SEARCH
            leftButton.isEnabled = true
            leftButton.image = UIImage(systemName: "arrow.left")
            rightButton1.isEnabled = false
            rightButton1.image = UIImage(systemName: "")
            rightButton1.tintColor = UIColor.clear
            rightButton2.isEnabled = false
            rightButton2.image = UIImage(systemName: "")
            rightButton2.tintColor = UIColor.clear
        case .setting:
            titleNavigationItem.title = Constant.TITLE_SETTING
            leftButton.isEnabled = true
            leftButton.image = UIImage(systemName: "arrow.left")
            rightButton1.isEnabled = false
            rightButton1.image = UIImage(systemName: "")
            rightButton1.tintColor = UIColor.clear
            rightButton2.isEnabled = false
            rightButton2.image = UIImage(systemName: "")
            rightButton2.tintColor = UIColor.clear
        case .player:
            titleNavigationItem.title = Constant.TITLE_BLANK
            navigationBar.backgroundColor = UIColor.black
            leftButton.isEnabled = true
            leftButton.image = UIImage(systemName: "arrow.left")
            rightButton1.isEnabled = false
            rightButton1.image = UIImage(systemName: "")
            rightButton1.tintColor = UIColor.clear
            rightButton2.isEnabled = false
            rightButton2.image = UIImage(systemName: "")
            rightButton2.tintColor = UIColor.clear
        }
    }
    
}
