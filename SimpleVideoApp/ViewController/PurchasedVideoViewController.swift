//
//  PurchasedVideoViewController.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/05.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit
import Rswift

struct VideoModel {
    let title: String
    
    init(title: String) {
        self.title = title
    }
}

class PurchasedVideoViewController: BaseViewController {
    
    // testデータ
    // 後ほどモデルに移す
    private let testVideo: [VideoModel] = [
        VideoModel(title: "それいけアンパンマン"),
        VideoModel(title: "ドラえもん"),
        VideoModel(title: "クレヨンしんちゃん")
    ]
    
    @IBOutlet weak var header: CustomNavigationBarView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        header.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        // Identifierの設定
        let nib = UINib(nibName: "VideoListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "VideoListTableViewCell2")
    }
    
    @IBAction func actionSort(_ sender: Any) {
        // 登録された日付で昇順、降順でソートを行う
        if sortButton.title == "購入日が新しい順" {
            sortButton.title = "購入日が古い順"
        } else {
            sortButton.title = "購入日が新しい順"
        }
    }
}

extension PurchasedVideoViewController: CustomNavigationBarViewDelegate {
    func actionLeftButton() {
        // メニューの表示
        slideMenuController()?.openLeft()
    }
    
    func actionRightButton1() {
        // リストに追加
    }
    
    func actionRightButton2() {
        // 更新
    }
}

// tableViewの何それ
extension PurchasedVideoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension PurchasedVideoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testVideo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.videoListTableViewCell,for: indexPath) else {
            return UITableViewCell()
        }
        cell.videoModel = testVideo[indexPath.row]
 */
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoListTableViewCell2", for: indexPath) as? VideoListTableViewCell else {
            return UITableViewCell()
        }
        cell.videoModel = testVideo[indexPath.row]
        return cell
    }
    
    
}
