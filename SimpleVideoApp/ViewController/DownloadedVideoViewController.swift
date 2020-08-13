//
//  DownloadedVideoTableViewController.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/06.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import SlideMenuControllerSwift
import UIKit

// MARK: - class

class DownloadedVideoViewController: BaseViewController {
    
    private var videoInfo: [VideoInfo] = []
    private var presenter: DownloadedVideoPresenterProtocol?
    
    @IBOutlet weak var header: CustomNavigationBarView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = DownloadedVideoPresenter()
        header.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        // Identifierの設定
        let nib = UINib(nibName: "VideoListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "VideoListTableViewCell2")

        showAllVideo()
    }
    
    private func showAllVideo() {
        let succes = { (items: [String]) -> Void in
            for item in items {
                self.videoInfo.append(VideoInfo(title: item))
            }
        }
        
        presenter?.doReadVideoInfo(succes: succes)
    }
    
    private func showVideoPlayer(name: String, path: String) {
        dismiss(animated: true, completion: nil)
        let storyboard = R.storyboard.videoPlayer()
        // VCは確実に存在するため強制アンラップを使用
        let vc = storyboard.instantiateViewController(withIdentifier: "VideoPlayerViewController") as! VideoPlayerViewController
        let filePath = path + "/" + name
        vc.filePath = filePath
        vc.modalPresentationStyle = .fullScreen
        
        UIApplication.shared.keyWindow?.rootViewController = vc
    }
}

// MARK: - extension

extension DownloadedVideoViewController: CustomNavigationBarViewDelegate {
    func actionLeftButton() {
        // メニューボタン表示
        slideMenuController()?.openLeft()
    }
    
    func actionRightButton1() {
        // 処理なし
        return
    }
    
    func actionRightButton2() {
        // 更新ボタン
        showAllVideo()
    }
}

extension DownloadedVideoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showVideoPlayer(name: videoInfo[indexPath.row].videoTitle, path: videoInfo[indexPath.row].filePath)
    }
}

extension DownloadedVideoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        videoInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoListTableViewCell2", for: indexPath) as? VideoListTableViewCell else {
            return UITableViewCell()
        }
        cell.videoModel = videoInfo[indexPath.row]
        return cell
    }
}
