//
//  FirebaseService.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/08.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import Firebase
import FirebaseAuth

protocol FirebaseServiceProtocol {
    func memberRegistration(email: String, password: String, succes: @escaping () -> Void)
    func signIn(email: String, password: String, succes: @escaping () -> Void, error: @escaping () -> Void)
    func signOut(succes: @escaping () -> Void)
    func passwordReset(email: String, succes: @escaping () -> Void)
}

class FirebaseService {
    static let shared = FirebaseService()
    private init() {}
}

extension FirebaseService: FirebaseServiceProtocol {
    
    func memberRegistration(email: String, password: String, succes: @escaping () -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("firebase createUser error : \(error)")
            } else {
                print("createUser succes : \(String(describing: result))")
                succes()
            }
        }
    }

    func signIn(email: String, password: String, succes: @escaping () -> Void, error: @escaping () -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, resultError in
            if let resultError = resultError {
                print("firebase signIn error : \(resultError)")
                error()
            } else {
                print("signIn succes : \(String(describing: result))")
                succes()
            }
        }
    }
    
    func signOut(succes: @escaping () -> Void) {
        do {
            try Auth.auth().signOut()
            succes()
            print("signOut succes")
        } catch let error as NSError {
            print("firebase signOut error : \(error)")
        }
    }
    
    func passwordReset(email: String, succes: @escaping () -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                print("firebase sendPasswordReset error : \(error)")
            } else {
                // 送信完了のラベルを表示
                print("passwordReset succes")
                succes()
            }
        }
    }
    
}
