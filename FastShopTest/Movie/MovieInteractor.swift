//
//  MovieInteractor.swift
//  FastShopTest
//
//  Created by Nicholas Matos on 2/9/18.
//  Copyright © 2018 Nicholas Matos. All rights reserved.
//

import UIKit

class MovieInteractor: NSObject {
    var currentTask: URLSessionTask?
    
    func getMoviesByGenre(id: String, successHandler: @escaping (_ responseObject: Array<Movie>?) -> (), errorHandler: @escaping (_ errorObject: NSError?, _ isCancelled: Bool) -> ()){
        if self.currentTask == nil || self.currentTask?.state != .running{
            let loading = LoadingPresenter()
            loading.showLoading()
            self.currentTask = TMDBGenreClient().getMoviesByGenreId(genreId: id, successHandler: { movies in
                loading.hideLoading()
                successHandler(movies)
            }) { error, isCancelled in
                loading.hideLoading()
                errorHandler(error, isCancelled)
            }
        }
    }
}
