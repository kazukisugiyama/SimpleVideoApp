//
//  BaseViewController.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/05.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit

protocol BaseViewProtocol: AnyObject {
    func closeView()
    func showStoryBoard(_ storyboard: UIKit.UIStoryboard)
}

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BaseViewController: BaseViewProtocol {
    func closeView() {
        dismiss(animated: true, completion: nil)
    }
    
    func showStoryBoard(_ storyboard: UIKit.UIStoryboard) {
        dismiss(animated: true, completion: nil)
        if let vc = storyboard.instantiateInitialViewController() {
            vc.modalPresentationStyle = .fullScreen
            guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else { return }
            rootViewController.present(vc, animated: false, completion: nil)
        }
    }
    
}
