//
//  DownloadedVideoTableViewController.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/06.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import SlideMenuControllerSwift
import UIKit

// MARK: - protocol

protocol DownloadedVideoViewControllerProtocol: BaseViewProtocol {
}

// MARK: - class

class DownloadedVideoViewController: BaseViewController {
    
    private var testVideo: [VideoInfo] = []
    private var presenter: DownloadedVideoPresenterProtocol?

    @IBOutlet weak var header: CustomNavigationBarView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        header.delegate = self
        /*
        presenter = DownloadedVideoPresenter()
        presenter?.displayAllVideo()
 */
        showAllVideo()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Identifierの設定
        let nib = UINib(nibName: "VideoListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "VideoListTableViewCell2")
    }
    
    private func showAllVideo() {
        // アプリ内に保存されている動画を全て表示する
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        do {
            let content = try FileManager.default.contentsOfDirectory(atPath: path)
            for data in content {
                testVideo.append(VideoInfo(title: data))
            }
        } catch {
            print("error")
        }
    }
    
    private func showVideoPlayer(name: String, path: String) {
        dismiss(animated: true, completion: nil)
        let storyboard = R.storyboard.videoPlayer()
        // VCは確実に存在するため強制アンラップを使用
        let vc = storyboard.instantiateViewController(withIdentifier: "VideoPlayerViewController") as! VideoPlayerViewController
        let filePath = path + "/" + name
        vc.filePath = filePath
        vc.modalPresentationStyle = .fullScreen
        
        guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else { return }
        rootViewController.present(vc, animated: true, completion: nil)
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
    }
}

extension DownloadedVideoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showVideoPlayer(name: testVideo[indexPath.row].videoTitle, path: testVideo[indexPath.row].filePath)
    }
}

extension DownloadedVideoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        testVideo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoListTableViewCell2", for: indexPath) as? VideoListTableViewCell else {
            return UITableViewCell()
        }
        cell.videoModel = testVideo[indexPath.row]
        return cell
    }
}
