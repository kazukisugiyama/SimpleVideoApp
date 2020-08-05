//
//  CommonPresenter.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/05.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

protocol CommonPresenterProtocol: AnyObject {
    func setBaseViewProtocol(viewController: BaseViewController)
}

class CommonPresenter: CommonPresenterProtocol {
    private weak var viewController: BaseViewProtocol?
    
    func setBaseViewProtocol(viewController: BaseViewController) {
        self.viewController = viewController
    }
}
