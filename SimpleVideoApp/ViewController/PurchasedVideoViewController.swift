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

class PurchasedVideoViewController: UIViewController {
    
    // testデータ
    private let testVideo: [VideoModel] = [
        VideoModel(title: "それいけアンパンマン"),
        VideoModel(title: "ドラえもん"),
        VideoModel(title: "クレヨンしんちゃん")
    ]
    
    @IBOutlet weak var header: CustomNavigationBarView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        header.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "VideoListTableViewCell", bundle: nil), forCellReuseIdentifier: "VideoListTableViewCell")
    }
    
    @IBAction func actionSort(_ sender: Any) {
        // 昇順、降順でソートを行う
    }
}

extension PurchasedVideoViewController: CustomNavigationBarViewDelegate {
    func actionLeftButton() {
        // メニューの表示
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.videoListTableViewCell,for: indexPath) else {
            return UITableViewCell()
        }
        cell.videoModel = testVideo[indexPath.row]
        return cell
    }
    
    
}
