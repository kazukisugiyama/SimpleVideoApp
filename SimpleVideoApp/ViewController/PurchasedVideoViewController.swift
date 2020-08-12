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

// MARK: - protocol

protocol PurchasedVideoViewControllerProtocol: BaseViewProtocol {
    //func testes(items: [StorageReference])
}

// MARK: - class

class PurchasedVideoViewController: BaseViewController {
    
    private var presenter: PurchasedVideoPresenterProtocol?
    private var model: FirebaseStorageServiceProtocol?
    private var testVideo: [VideoInfo] = []
    
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
        tableView.register(nib, forCellReuseIdentifier: "VideoListTableViewCell")
        
        showStorageAllVideo(isSync: false)
        
        //TODO: 後ほど削除
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        print("localFilePath: \(path)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func actionSort(_ sender: Any) {
        // 登録された日付で昇順、降順でソートを行う
        if sortButton.title == "購入日が新しい順" {
            sortButton.title = "購入日が古い順"
        } else {
            sortButton.title = "購入日が新しい順"
        }
    }
    
    private func showStorageAllVideo(isSync: Bool) {
        let succes = { (item: String) -> Void in
            if (isSync) {
                var titles: [String] = []
                for title in self.testVideo {
                    titles.append(title.videoTitle)
                }
                guard !titles.contains(item) else { return }
            }
            
            self.testVideo.append(VideoInfo(title: item))
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        model = FirebaseStorageService()
        model?.displayStorageAllVideo(succes: succes)
    }
    
    private func showDownloadedVideo() {
        let storyboard = R.storyboard.downloadedVideoBase()
        showStoryBoard(storyboard)
    }
    
}

// MARK: - extension

extension PurchasedVideoViewController: CustomNavigationBarViewDelegate {
    func actionLeftButton() {
        slideMenuController()?.openLeft()
    }
    
    func actionRightButton1() {
        // リストに追加
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
        return testVideo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoListTableViewCell", for: indexPath) as? VideoListTableViewCell else {
            return UITableViewCell()
        }
        cell.videoModel = testVideo[indexPath.row]
        return cell
    }
}
