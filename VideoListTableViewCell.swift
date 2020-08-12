//
//  VideoListTableViewCell.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/05.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit
import RealmSwift

// MARK: - protocol

protocol VideoListTableViewCellDelegate: AnyObject {
    func downloadVideo(fileName: String)
}

// MARK: - class

class VideoListTableViewCell: UITableViewCell {
    
    let entity = VideoInfoEntity()
    var delegate: VideoListTableViewCellDelegate?
    var videoModel: VideoInfo? {
        didSet {
            guard let model = videoModel else { return }
            titleLabel.text = model.videoTitle
        }
    }
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func actionDownload(_ sender: Any) {
        // 端末にダウンロードを行う
        print("DownLoad")
        // TODO: なぜ自クラスのインスタンス化を行わなければいけないのか？
        delegate = VideoListTableViewCell()
        guard let fileName = titleLabel.text else { return }
        delegate?.downloadVideo(fileName: fileName)
    }
}

// MARK: - extension

extension VideoListTableViewCell: VideoListTableViewCellDelegate {
    func downloadVideo(fileName: String) {
        FirebaseStorageService.shared.downLoadVideo(fileName: fileName)
        
        // TODO: 確認のため現在時刻を保存
        let date = Date()
        entity.addVideoInfoEntity(title: fileName, date: date)
        
        // TODO: 実機が届き次第動作確認、一旦コメントアウト
        // Wi-Fiに接続されているか否か
        /*
        let succes = { () -> Void in
            FirebaseStorageService.shared.downLoadVideo(fileName: fileName)
        }
        NetworkStatusService.shared.downLoadVideo(succes: succes, isDownload: true)
        */
    }
}
