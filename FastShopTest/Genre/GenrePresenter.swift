//
//  GenrePresenter.swift
//  FastShopTest
//
//  Created by Nicholas Matos on 2/9/18.
//  Copyright © 2018 Nicholas Matos. All rights reserved.
//

import UIKit

class GenrePresenter: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, GenreCollectionVCDelegate {
    
    let genreCollection = GenreCollectionVC(nibName: "GenreCollectionVC", bundle: Bundle.main)
    var genres: Array<Genre> = []
    let genreInteractor = GenreInteractor()

    func registerDelegate(){
        self.genreCollection.delegate = self
    }
    
    func didLoad() {
        self.loadContent()
    }
    
    func loadContent(){
        genreCollection.collectionView.register(UINib(nibName: "GenreCellCollection", bundle: nil), forCellWithReuseIdentifier: "GenreCellCollection")
        genreCollection.collectionView.delegate = self
        genreCollection.collectionView.dataSource = self
        
        genreInteractor.getGenresContent(successHandler: { genres in
            self.genres = genres!
            self.genreCollection.collectionView.reloadData()
        }) { error, isCancelled in
            
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: GenreCellCollection = genreCollection.collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCellCollection", for: indexPath) as! GenreCellCollection
        
        let content = self.genres[indexPath.row]
        
        cell.genreButton.setTitle(content.name?.uppercased(), for: .normal)
        cell.genreId = content.id!
        cell.collectionView.alpha = 0.0
        
        cell.genreCellInteractor.getMoviesByGenre(id: content.id!, successHandler: { movies in
            cell.movies = movies!
            cell.collectionView.reloadData()
            cell.collectionView.alpha = 1.0
        }, errorHandler: { Error, isCancelled in
            
        })
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.size.width, height: 230.0)
    }
}
