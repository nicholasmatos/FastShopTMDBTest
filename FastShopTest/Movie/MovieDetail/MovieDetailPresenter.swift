//
//  MovieDetailPresenter.swift
//  FastShopTest
//
//  Created by Nicholas Matos on 2/9/18.
//  Copyright © 2018 Nicholas Matos. All rights reserved.
//

import UIKit

class MovieDetailPresenter: NSObject , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MovieDetailCollectionVCDelegate {
    
    let movieDetailCollection = MovieDetailCollectionVC(nibName: "MovieDetailCollectionVC", bundle: Bundle.main)
    var movie: Movie?
    let movieDetailInteractor = MovieDetailInteractor()
    
    var heightOverview: CGFloat = 0.0
    
    func registerDelegate(){
        self.movieDetailCollection.delegate = self
    }
    
    func didLoad() {
        self.loadContent()
    }
    
    func loadContent(){
        movieDetailCollection.collectionView.register(UINib(nibName: "MovieDetailHeaderCell", bundle: nil), forCellWithReuseIdentifier: "MovieDetailHeaderCell")
        movieDetailCollection.collectionView.register(UINib(nibName: "MovieDetailFooterCell", bundle: nil), forCellWithReuseIdentifier: "MovieDetailFooterCell")
        movieDetailCollection.collectionView.delegate = self
        movieDetailCollection.collectionView.dataSource = self
        
        movieDetailInteractor.getMoviesDetail(id: movie!.id!, successHandler: { movie in
            self.movie = movie!
            self.movieDetailCollection.navigationItem.title = self.movie!.title
            self.movieDetailCollection.collectionView.reloadData()
        }) { error, isCancelled in
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {  
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0{
            let cell: MovieDetailHeaderCell = movieDetailCollection.collectionView.dequeueReusableCell(withReuseIdentifier: "MovieDetailHeaderCell", for: indexPath) as! MovieDetailHeaderCell
            
            cell.titleLabel.text = movie!.title
            cell.releaseDateLabel.text = movie!.releaseDate
            cell.voteAverageLabel.makeAveragePercent(percent: movie!.voteAverage!)
            cell.voteAverageLabel.text = "\(movie!.voteAverage! * 10) %"
            cell.play.makeCircleWithColor(color: .white)
            
            if let posterUrl = URL(string: ImageHelper.getImageUrl(widthSize: "500", suffix: movie!.posterImage)){
                cell.posterImage.sd_setImage(with: posterUrl, completed: nil)
            }
            
            if let backdropUrl = URL(string: ImageHelper.getImageUrl(widthSize: "500", suffix: movie!.backdropImage)){
                cell.backdropImage.sd_setImage(with: backdropUrl, completed: nil)
            }
            
            return cell
        }else{
            let cell: MovieDetailFooterCell = movieDetailCollection.collectionView.dequeueReusableCell(withReuseIdentifier: "MovieDetailFooterCell", for: indexPath) as! MovieDetailFooterCell
            
            cell.overviewLabel.text = movie!.overview
            
            heightOverview = cell.overviewLabel.heightForView(movie!.overview!, width: UIScreen.main.bounds.size.width - 40.0)
            
            self.movieDetailCollection.collectionView.collectionViewLayout.invalidateLayout()
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0{
            return CGSize(width: UIScreen.main.bounds.size.width, height: 550.0)
        }else{
            return CGSize(width: UIScreen.main.bounds.size.width, height: heightOverview + 60.0)
        }
    }
}
