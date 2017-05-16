//
//  CollectionsViewController.swift
//  MaterialComponentsSamples
//
//  Created by hiraya.shingo on 2017/05/12.
//  Copyright © 2017年 shingohry. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialCollections

class CollectionsViewController: MDCCollectionViewController {
    let components = ["ActivityIndicator", "AnimationTiming", "AppBar", "ButtonBar", "Buttons", "CollectionCells", "CollectionLayoutAttributes", "Collections", "Dialogs", "FeatureHighlight", "FlexibleHeader", "HeaderStackView", "Ink"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        styler.cellStyle = .card
    }
}

// MARK: UICollectionViewDataSource
extension CollectionsViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return components.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MDCCollectionViewTextCell
        cell.textLabel?.text = components[indexPath.item]
        return cell
    }
}
