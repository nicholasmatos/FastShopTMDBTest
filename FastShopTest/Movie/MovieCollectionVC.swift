//
//  MovieCollectionVC.swift
//  FastShopTest
//
//  Created by Nicholas Matos on 2/9/18.
//  Copyright © 2018 Nicholas Matos. All rights reserved.
//

import UIKit

protocol MovieCollectionVCDelegate {
    func didLoad()
}

class MovieCollectionVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var delegate: MovieCollectionVCDelegate?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Movies"
        self.navigationController?.navigationBar.barStyle = .black
        delegate?.didLoad()
    }
}
