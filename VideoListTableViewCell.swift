//
//  VideoListTableViewCell.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/05.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit

protocol VideoListTableViewCellDelegate: AnyObject {
    func downloadVideo(fileName: String)
}

class VideoListTableViewCell: UITableViewCell {
    
    var delegate: VideoListTableViewCellDelegate?
    // TODO: presenterで取り扱うべき
    var firebaseStorageService: FirebaseStorageServiceProtocol?
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    var videoModel: VideoInfo? {
        didSet {
            guard let model = videoModel else { return }
            titleLabel.text = model.videoTitle
        }
    }
    
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

extension VideoListTableViewCell: VideoListTableViewCellDelegate {
    func downloadVideo(fileName: String) {
        print("downloadVideo()")
        // TODO: presenterで取り扱うべき
        firebaseStorageService = FirebaseStorageService()
        firebaseStorageService?.downLoadVideo(fileName: fileName)
    }
}
