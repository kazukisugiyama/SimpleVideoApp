//
//  videoInfo.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/08.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import Foundation

struct VideoInfo {
    let videoID: String
    let videoTitle: String
    let purchaseData: Data

    init(data: [String: Any]) {
        videoID = data["videoID"] as! String
        videoTitle = data["videoTitle"] as! String
        purchaseData = data["purchaseData"] as! Data
    }
}
