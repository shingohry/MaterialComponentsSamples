//
//  ButtonsViewController.swift
//  MaterialComponentsSamples
//
//  Created by hiraya.shingo on 2017/05/12.
//  Copyright © 2017年 shingohry. All rights reserved.
//

import UIKit
import MaterialComponents

class ButtonsViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flatButton = MDCFlatButton()
        flatButton.customTitleColor = UIColor.gray
        flatButton.setTitle("Flat Button", for: .normal)
        flatButton.sizeToFit()
        flatButton.addTarget(self, action: #selector(ButtonsViewController.flatButtonDidTap), for: .touchUpInside)
        stackView.addArrangedSubview(flatButton)
        
        let raisedButton = MDCRaisedButton()
        // See https://material.io/guidelines/what-is-material/elevation-shadows.html
        raisedButton.setElevation(4, for: .normal)
        raisedButton.setTitle("Raised Button", for: .normal)
        raisedButton.sizeToFit()
        raisedButton.addTarget(self, action: #selector(ButtonsViewController.raisedButtonDidTap), for: .touchUpInside)
        stackView.addArrangedSubview(raisedButton)
        
        
        let floatingButton = MDCFloatingButton()
        floatingButton.setTitle("+", for: .normal)
        floatingButton.sizeToFit()
        floatingButton.addTarget(self, action: #selector(ButtonsViewController.floatingButtonDidTap), for: .touchUpInside)
        stackView.addArrangedSubview(floatingButton)
    }
    
    func flatButtonDidTap() {
        print(#function)
    }
    
    func raisedButtonDidTap() {
        print(#function)
    }
    
    func floatingButtonDidTap() {
        print(#function)
    }
}
