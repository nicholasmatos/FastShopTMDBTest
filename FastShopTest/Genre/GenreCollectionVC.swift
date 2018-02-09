//
//  GenreCollectionVC.swift
//  FastShopTest
//
//  Created by Nicholas Matos on 2/9/18.
//  Copyright © 2018 Nicholas Matos. All rights reserved.
//

import UIKit

protocol GenreCollectionVCDelegate {
    func didLoad()
}

class GenreCollectionVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var delegate: GenreCollectionVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Genres"
        self.navigationController?.navigationBar.barStyle = .black
        delegate?.didLoad()
    }
}
