//
//  MovieDetailInteractor.swift
//  FastShopTest
//
//  Created by Nicholas Matos on 2/9/18.
//  Copyright © 2018 Nicholas Matos. All rights reserved.
//

import UIKit

class MovieDetailInteractor: NSObject {
    var currentTask: URLSessionTask?
    
    func getMoviesDetail(id: String, successHandler: @escaping (_ responseObject: Movie?) -> (), errorHandler: @escaping (_ errorObject: NSError?, _ isCancelled: Bool) -> ()){
        if self.currentTask == nil || self.currentTask?.state != .running{
            let loading = LoadingPresenter()
            loading.showLoading()
            self.currentTask = TMDBMovieClient().getMovieDetail(id: id, successHandler: { movie in
                loading.hideLoading()
                successHandler(movie)
            }) { error, isCancelled in
                loading.hideLoading()
                errorHandler(error, isCancelled)
            }
        }
    }
}
