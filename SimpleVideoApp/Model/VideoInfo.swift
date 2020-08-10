//
//  videoInfo.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/08.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import Foundation

struct VideoInfo {
    let videoTitle: String
    let filePath: String

    init(title: String) {
        videoTitle = title
        // ローカルの保管場所は変化しない想定
        filePath = Constant.LOCAL_DOCUMENTS_URL
    }
}
