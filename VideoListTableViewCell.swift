//
//  VideoListTableViewCell.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/05.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit

class VideoListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var videoModel: VideoModel? {
        didSet {
            guard let model = videoModel else { return }
            titleLabel.text = model.title
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel.text = ""
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func actionDownload(_ sender: Any) {
        // 端末にダウンロードを行う
    }
}
