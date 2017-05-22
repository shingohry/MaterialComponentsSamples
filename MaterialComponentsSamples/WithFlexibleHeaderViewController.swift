//
//  WithFlexibleHeaderViewController.swift
//  MaterialComponentsSamples
//
//  Created by hiraya.shingo on 2017/05/18.
//  Copyright © 2017年 shingohry. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialAppBar

class WithFlexibleHeaderViewController: UITableViewController {
    let appBar = MDCAppBar()
    
    override var childViewControllerForStatusBarStyle: UIViewController? {
        return appBar.headerViewController
    }
    
    // When using MDCFlexibileHeaderController within a UINavigationController, setting the UINavigationController's navigationBarHidden property to YES results in the loss of the swipe-to-go-back feature associated with the controller.
    // To re-enable this feature whilst hiding the navigation controller's navigationBar we recommend setting a pointer to the current interactivePopGestureRecognizer's delegate in the viewWillAppear: method before setting the navigationBarHidden property to YES, setting the interactivePopGestureRecognizer's delegate to nil while the MDCFlexibileHeaderController's parent controller is actively on-screen in viewDidAppear:, then re-setting the interactivePopGestureRecognizer's delegate to the held pointer in the viewWillDisappear: method.
    
    // For Edge Swipe (1/4)
    // Create pointer to hold active interactivePopGestureRecognizer delegate
    var existingInteractivePopGestureRecognizerDelegate : UIGestureRecognizerDelegate?
    
    
    // It is also possible to hide the status bar when shifting the Flexible Header off-screen.
    // Enable this behavior by setting the EnabledWithStatusBar behavior and implementing childViewControllerForStatusBarHidden on the parent view controller.
    override var childViewControllerForStatusBarHidden: UIViewController? {
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
        
        // Shifting a Flexible Header off-screen
        appBar.headerViewController.headerView.shiftBehavior = .enabledWithStatusBar
        
        // Tracking a scroll view
        // Forward UIScrollViewDelegate events to the Header View.
        tableView.delegate = appBar.headerViewController
        // Set the tracking scroll view.
        appBar.headerViewController.headerView.trackingScrollView = tableView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // For Edge Swipe (2/4)
        // Hold reference to current interactivePopGestureRecognizer delegate
        if navigationController?.interactivePopGestureRecognizer?.delegate != nil {
            existingInteractivePopGestureRecognizerDelegate = navigationController?.interactivePopGestureRecognizer?.delegate!
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // For Edge Swipe (3/4)
        // Set interactivePopGestureRecognizer delegate to nil
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // For Edge Swipe (4/4)
        // Return interactivePopGestureRecognizer delegate to previously held object
        if existingInteractivePopGestureRecognizerDelegate != nil {
            navigationController?.interactivePopGestureRecognizer?.delegate = existingInteractivePopGestureRecognizerDelegate!
        }
    }
}

//extension WithFlexibleHeaderViewController {
//    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView == appBar.headerViewController.headerView.trackingScrollView {
//            appBar.headerViewController.headerView.trackingScrollDidScroll()
//        }
//    }
//
//    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        if scrollView == appBar.headerViewController.headerView.trackingScrollView {
//            appBar.headerViewController.headerView.trackingScrollDidEndDecelerating()
//        }
//    }
//
//    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        let headerView = appBar.headerViewController.headerView
//        if scrollView == headerView.trackingScrollView {
//            headerView.trackingScrollDidEndDraggingWillDecelerate(decelerate)
//        }
//    }
//
//    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        let headerView = appBar.headerViewController.headerView
//        if scrollView == headerView.trackingScrollView {
//            headerView.trackingScrollWillEndDragging(withVelocity: velocity, targetContentOffset: targetContentOffset)
//        }
//    }
//}
