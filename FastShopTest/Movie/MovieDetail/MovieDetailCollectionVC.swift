//
//  MovieDetailCollectionVC.swift
//  FastShopTest
//
//  Created by Nicholas Matos on 2/9/18.
//  Copyright © 2018 Nicholas Matos. All rights reserved.
//

import UIKit

protocol MovieDetailCollectionVCDelegate {
    func didLoad()
}

class MovieDetailCollectionVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var delegate: MovieDetailCollectionVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate?.didLoad()
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
        
        self.automaticallyAdjustsScrollViewInsets = false
    }
}
