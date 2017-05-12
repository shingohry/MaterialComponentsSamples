//
//  ThirdViewController.swift
//  MaterialComponentsSamples
//
//  Created by hiraya.shingo on 2017/05/12.
//  Copyright © 2017年 shingohry. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialDialogs

class ThirdViewController: UIViewController {
    let dialogTransitionController = MDCDialogTransitionController()
    var contentViewController: DialogContentViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showAlertButtonDidTap(_ sender: Any) {
        // Present a modal alert
        let alertController = MDCAlertController(title: "title", message: "This is MDCAlertController")
        let action = MDCAlertAction(title:"OK") { (action) in print("OK") }
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func showDialogVCButtonDidTap(_ sender: Any) {
        contentViewController = self.storyboard?.instantiateViewController(withIdentifier: "dialogViewController") as! DialogContentViewController
        contentViewController.modalPresentationStyle = .custom
        contentViewController.transitioningDelegate = dialogTransitionController
        
        present(contentViewController!, animated: true, completion: nil)
    }
}
