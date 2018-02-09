//
//  GenreCellCollection.swift
//  FastShopTest
//
//  Created by Nicholas Matos on 2/9/18.
//  Copyright © 2018 Nicholas Matos. All rights reserved.
//

import UIKit
import SDWebImage

class GenreCellCollection: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var genreButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var genreId: String = ""
    var movies: Array<Movie> = []
    let genreCellInteractor = GenreCellInteractor()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.collectionView.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieCell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let content = self.movies[indexPath.row]
        
        cell.titleLabel.text = content.title
        let url = URL(string: ImageHelper.getImageUrl(widthSize: "200", suffix: content.posterImage!))
        cell.imageView.sd_setImage(with: url, completed: nil)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (self.collectionView.frame.height - 30.0) * 0.701, height: self.collectionView.frame.height)
    }
    
    @IBAction func moviesByGenre(_ sender: Any) {
        MainRouter().showMovieCollection(genreId: self.genreId)
    }
}
