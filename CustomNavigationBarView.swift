//
//  CustomNavigationBarView.swift
//  
//
//  Created by 杉山和輝 on 2020/08/05.
//

import UIKit

protocol CustomNavigationBarViewDelegate: AnyObject {
    func actionLeftButton()
    func actionRightButton1()
    func actionRightButton2()
}

class CustomNavigationBarView: BaseView {
    private enum HeaderType: Int {
        case purchased
        case downloaded
        case myList
        case search
        case setting
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
    
    @IBOutlet weak var leftButton: UIBarButtonItem!
    @IBOutlet weak var rightButton1: UIBarButtonItem!
    @IBOutlet weak var rightButton2: UIBarButtonItem!
    
    override func initView() {
        super.initView()
    }
    
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
    
    private func updateView() {
        switch headerType {
        case .purchased:
            leftButton.isEnabled = true
            leftButton.image = UIImage(systemName: "line.horizontal.3")
            rightButton1.isEnabled = true
            rightButton1.image = UIImage(systemName: "folder.badge.plus")
            rightButton2.isEnabled = true
            rightButton2.image = UIImage(systemName: "arrow.counterclockwise")
        case .downloaded:
            leftButton.isEnabled = true
            leftButton.image = UIImage(systemName: "line.horizontal.3")
            rightButton1.isEnabled = false
            rightButton1.image = UIImage(systemName: "")
            rightButton2.isEnabled = true
            rightButton2.image = UIImage(systemName: "arrow.counterclockwise")
        case .myList:
            leftButton.isEnabled = true
            leftButton.image = UIImage(systemName: "line.horizontal.3")
            rightButton1.isEnabled = true
            rightButton1.image = UIImage(systemName: "pencil")
            rightButton2.isEnabled = true
            rightButton2.image = UIImage(systemName: "arrow.counterclockwise")
        case .search:
            leftButton.isEnabled = true
            leftButton.image = UIImage(systemName: "arrow.left")
            rightButton1.isEnabled = false
            rightButton1.image = UIImage(systemName: "")
            rightButton2.isEnabled = false
            rightButton2.image = UIImage(systemName: "")
        case .setting:
            leftButton.isEnabled = true
            leftButton.image = UIImage(systemName: "arrow.left")
            rightButton1.isEnabled = false
            rightButton1.image = UIImage(systemName: "")
            rightButton2.isEnabled = false
            rightButton2.image = UIImage(systemName: "")
        }
    }
    

}
