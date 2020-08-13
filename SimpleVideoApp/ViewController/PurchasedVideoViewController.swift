//
//  PurchasedVideoViewController.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/05.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit
import Rswift
import FirebaseStorage

// MARK: - class

class PurchasedVideoViewController: BaseViewController {
    
    private var presenter: PurchasedVideoPresenterProtocol?
    private var videoInfo: [VideoInfo] = []
    
    @IBOutlet weak var header: CustomNavigationBarView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = PurchasedVideoPresenter()
        header.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        // Identifierの設定
        let nib = UINib(nibName: "VideoListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "VideoListTableViewCell")
        
        showStorageAllVideo(isSync: false)
    }
    
    @IBAction func actionSort(_ sender: Any) {
        // 登録された日付で昇順、降順でソートを行う
        if sortButton.title == Constant.PURCHASE_DATE_NEW_ORDER {
            sortButton.title = Constant.PURCHASE_DATE_OLD_ORDER
        } else {
            sortButton.title = Constant.PURCHASE_DATE_NEW_ORDER
        }
    }
    
    private func showStorageAllVideo(isSync: Bool) {
        let succes = { (item: String) -> Void in
            if (isSync) {
                var titles: [String] = []
                for title in self.videoInfo {
                    titles.append(title.videoTitle)
                }
                guard !titles.contains(item) else { return }
            }
            
            self.videoInfo.append(VideoInfo(title: item))
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        presenter?.doDisplayStorageAllVideo(succes: succes)
    }

}

// MARK: - extension

extension PurchasedVideoViewController: CustomNavigationBarViewDelegate {
    func actionLeftButton() {
        slideMenuController()?.openLeft()
    }
    
    func actionRightButton1() {
        // TODO: マイリストに追加
    }
    
    func actionRightButton2() {
        showStorageAllVideo(isSync: true)
    }
}

extension PurchasedVideoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension PurchasedVideoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoListTableViewCell", for: indexPath) as? VideoListTableViewCell else {
            return UITableViewCell()
        }
        cell.videoModel = videoInfo[indexPath.row]
        return cell
    }
}
