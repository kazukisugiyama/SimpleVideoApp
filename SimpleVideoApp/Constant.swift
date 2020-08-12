//
//  Constant.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/10.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import Foundation

class Constant{
    // MARK: - UserDefaults Key
    
    static let USER_DEFAULTS_KEY_STREAM_SETTING = "STREAM_SETTING"
    static let USER_DEFAULTS_KEY_DOWNLOAD_SETTING = "DOWNLOAD_SETTING"
    
    // MARK: - Constant
    
    static let STORAGE_URL = "gs://simplevideoapp-17ce7.appspot.com"
    static let STORAGE_URL_ADD_SLASH = "gs://simplevideoapp-17ce7.appspot.com/"
    static let LOCAL_DOCUMENTS_URL = "file://" + NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    
    // MARK: - Display Parts
    static let PURCHASE_DATE_NEW_ORDER = "購入日が新しい順"
    static let PURCHASE_DATE_OLD_ORDER = "購入日が古い順"
    static let PLACEHOLDER_TEXT_MAIL = "メールアドレス"
    static let PLACEHOLDER_TEXT_PASSWORD = "パスワード"
    static let PLACEHOLDER_TEXT_PASSWORD_CONFIRMATION = "パスワード確認"
    static let ERROR_TEXT_BLANK_MAIL = "メールアドレスが入力されていません"
    static let ERROR_TEXT_BLANK_PASSWORD = "パスワードが入力されていません"
    static let ERROR_TEXT_UNREGISTERED_MAIL = "入力されたメールアドレスは登録されていません"
    static let ERROR_TEXT_UNREGISTERED_PASSWORD = "入力されたパスワードは登録されていません"
    static let TITLE_PURCHASED = "購入済み"
    static let TITLE_DOWNLOADED = "ダウンロード済み"
    static let TITLE_MYLIST = "マイリスト"
    static let TITLE_SEARCH = "検索"
    static let TITLE_SETTING = "設定"
    static let TITLE_BLANK = ""
}

