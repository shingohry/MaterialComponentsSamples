//
//  AppBarViewController.swift
//  MaterialComponentsSamples
//
//  Created by hiraya.shingo on 2017/05/17.
//  Copyright © 2017年 shingohry. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialAppBar

class AppBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(#function)
    }
}

class ModalVCWithAppBarViewController: UIViewController {
    // Create an instance of MDCAppBar
    let appBar = MDCAppBar()
    
    // MDCHeaderViewController instances are able to recommend a status bar style by inspecting the background color of the MDCFlexibleHeaderView. If you'd like to use this logic to automatically update your status bar style, implement childViewControllerForStatusBarStyle in your app's view controller.
    override var childViewControllerForStatusBarStyle: UIViewController? {
        return appBar.headerViewController
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        print(#function)
        
        // add the headerViewController as a child view controller.
        self.addChildViewController(appBar.headerViewController)
        
        appBar.navigationBar.tintColor = UIColor.white
        appBar.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        appBar.headerViewController.headerView.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        
        appBar.navigationBar.leadingBarButtonItem = UIBarButtonItem(title: "DONE",
                                                                    style: .done,
                                                                    target: self,
                                                                    action: #selector(leadingBarButtonDidtap))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(#function)
        
        // After all other views have been registered.
        appBar.addSubviewsToParent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func leadingBarButtonDidtap() {
        dismiss(animated: true, completion: nil)
    }
}
