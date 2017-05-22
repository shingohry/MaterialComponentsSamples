//
//  WithHeaderStackViewController.swift
//  MaterialComponentsSamples
//
//  Created by hiraya.shingo on 2017/05/18.
//  Copyright © 2017年 shingohry. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialAppBar

class WithHeaderStackViewController: UIViewController {
    let appBar = MDCAppBar()
    
    override var childViewControllerForStatusBarStyle: UIViewController? {
        return appBar.headerViewController
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        print(#function)
        
        self.addChildViewController(appBar.headerViewController)
        
        appBar.navigationBar.tintColor = UIColor.white
        appBar.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        appBar.headerViewController.headerView.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(#function)
        
        appBar.addSubviewsToParent()

        
        // TODO
        let imageView = UIImageView(image: UIImage(named: "image"))
        imageView.frame = CGRect(origin: .zero, size: CGSize(width: 375, height: 100))
        appBar.headerStackView.bottomBar = imageView
        
        appBar.headerStackView.autoresizingMask = .flexibleWidth
        
//        let frame = self.view.bounds
        appBar.headerViewController.headerView.frame = CGRect(origin: .zero, size: CGSize(width: 375, height: 100 + 76))
        
//        appBar.headerStackView.sizeToFit()
        //
    }
}
