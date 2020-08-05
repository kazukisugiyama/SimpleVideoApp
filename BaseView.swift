//
//  BaseView.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/05.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit

class BaseView: UIView {
    private var view: UIView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    open func initView() {
        xibSetup()
    }

    private func loadNib() -> UIView? {
        guard let nibName = type(of: self).description().components(separatedBy: ".").last else { return nil }
        return Bundle.main.loadNibNamed(nibName, owner: self, options: nil)?.first as? UIView
    }
    
    func xibSetup() {
        guard let view = loadNib() else { return }

        self.view = view
        backgroundColor = UIColor.clear
        view.frame = bounds
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": view]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": view]))
    }
}
