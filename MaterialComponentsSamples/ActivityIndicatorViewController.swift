//
//  ActivityIndicatorViewController.swift
//  MaterialComponentsSamples
//
//  Created by hiraya.shingo on 2017/05/16.
//  Copyright © 2017年 shingohry. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialActivityIndicator

class ActivityIndicatorViewController: UIViewController {
    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet weak var bottomStackView: UIStackView!
    
    var indeterminateIndicator: MDCActivityIndicator!
    var determinateIndicator: MDCActivityIndicator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addIndeterminateIndicator()
        addDeterminateIndicator()
    }
    
    func addIndeterminateIndicator() {
        indeterminateIndicator = MDCActivityIndicator(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        topStackView.insertArrangedSubview(indeterminateIndicator, at: 0)
    }
    
    func addDeterminateIndicator() {
        determinateIndicator = MDCActivityIndicator(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        determinateIndicator.indicatorMode = .determinate
        bottomStackView.insertArrangedSubview(determinateIndicator, at: 0)
    }
    
    @IBAction func startIndeterminateIndicator(_ sender: Any) {
        indeterminateIndicator.startAnimating()
    }
    
    @IBAction func stopIndeterminateIndicator(_ sender: Any) {
        indeterminateIndicator.stopAnimating()
    }
    
    @IBAction func startDeterminateIndicator(_ sender: Any) {
        determinateIndicator.progress = 0.3
        determinateIndicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1)) {
            self.determinateIndicator.progress = 1.0
        }
    }
    
    @IBAction func stopDeterminateIndicator(_ sender: Any) {
        determinateIndicator.stopAnimating()
    }
}
