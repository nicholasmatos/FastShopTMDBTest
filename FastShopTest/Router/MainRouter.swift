//
//  MainRouter.swift
//  FastShopTest
//
//  Created by Nicholas Matos on 2/9/18.
//  Copyright © 2018 Nicholas Matos. All rights reserved.
//

import UIKit

class MainRouter: NSObject {

    func showMovieCollection(genreId: String){
        let moviePresenter = MoviePresenter()
        moviePresenter.id = genreId
        moviePresenter.registerDelegate()
        
        if let navigation = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
            navigation.pushViewController(moviePresenter.movieCollection, animated: true)
        }
    }
    
    func showMovieDetail(movie: Movie){
        let movieDetailPresenter = MovieDetailPresenter()
        movieDetailPresenter.movie = movie
        movieDetailPresenter.registerDelegate()
        
        if let navigation = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
            navigation.pushViewController(movieDetailPresenter.movieDetailCollection, animated: true)
        }
    }
}
