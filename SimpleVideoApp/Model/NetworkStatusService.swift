//
//  NetworkStatusService.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/10.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import Foundation
import Reachability

protocol NetworkStatusServiceProtocol {
    func downLoadVideo(succes: @escaping () -> Void, isDownload: Bool)
}

class NetworkStatusService {
    // TODO: シュミレータの場合NotReachableの分岐に入り落ちる
    func tes(succes: @escaping () -> Void, isDownload: Bool) {
        let entity = WiFiSettingEntity()
        let reachability = Reachability()
        let netStatus = reachability.currentReachabilityStatus()
        
        switch netStatus {
        case .NotReachable: // 圏外
            print("stats not")
            break
        case .ReachableViaWWAN: // 3G
            print("stats WWAN")
            break
        case .ReachableViaWiFi: // Wi-Fi
            print("stats WiFi")
            if (isDownload) {
                guard !entity.downloadWiFiOnly else { return }
            } else {
                guard !entity.streamWiFiOnly else { return }
            }
            break
        @unknown default:
            print("stats unknown")
            break
        }
        succes()
    }
}

extension NetworkStatusService: NetworkStatusServiceProtocol {
    func downLoadVideo(succes: @escaping () -> Void, isDownload: Bool) {
        tes(succes: succes, isDownload: isDownload)
    }
}
