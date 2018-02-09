//
//  MoviePresenter.swift
//  FastShopTest
//
//  Created by Nicholas Matos on 2/9/18.
//  Copyright © 2018 Nicholas Matos. All rights reserved.
//

import UIKit

class MoviePresenter: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MovieCollectionVCDelegate {
    
    let marginCell: CGFloat = 10.0
    let heightCell: CGFloat = 1.426
    let currentLineCount: CGFloat = 3
    
    let movieCollection = MovieCollectionVC(nibName: "MovieCollectionVC", bundle: Bundle.main)
    var id: String = ""
    var movies: Array<Movie> = []
    let movieInteractor = MovieInteractor()
    
    func registerDelegate(){
        self.movieCollection.delegate = self
    }
    
    func didLoad() {
        self.loadContent()
    }
    
    func loadContent(){
        movieCollection.collectionView.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
        movieCollection.collectionView.delegate = self
        movieCollection.collectionView.dataSource = self
        
        movieInteractor.getMoviesByGenre(id: id, successHandler: { movies in
            self.movies = movies!
            self.movieCollection.collectionView.reloadData()
        }) { error, isCancelled in
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieCell = movieCollection.collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let content = self.movies[indexPath.row]
        
        cell.titleLabel.text = content.title
        let url = URL(string: ImageHelper.getImageUrl(widthSize: "200", suffix: content.posterImage!))
        cell.imageView.sd_setImage(with: url, completed: nil)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let heightTitle: CGFloat = 30.0
        let width = (movieCollection.collectionView.frame.width / self.currentLineCount) - ((self.currentLineCount - 1.0) * (marginCell / self.currentLineCount))
        let height = (width * self.heightCell) + heightTitle
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let content = self.movies[indexPath.row]
        MainRouter().showMovieDetail(movie: content)
    }
}
