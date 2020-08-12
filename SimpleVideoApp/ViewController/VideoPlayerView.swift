//
//  VideoPlayerView.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/07.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import AVFoundation
import UIKit

// MARK: - class

class VideoPlayerView: UIView {
    
    var player: AVPlayer? {
        get { return playerLayer.player }
        set { playerLayer.player = newValue }
    }
    
    var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer
    }
    
    override class var layerClass: AnyClass {
        return AVPlayerLayer.self
    }

}
