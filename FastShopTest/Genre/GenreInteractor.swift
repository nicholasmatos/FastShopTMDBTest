//
//  GenreInteractor.swift
//  FastShopTest
//
//  Created by Nicholas Matos on 2/9/18.
//  Copyright © 2018 Nicholas Matos. All rights reserved.
//

import UIKit

class GenreInteractor: NSObject {
    
    var currentTask: URLSessionTask?
    
    func getGenresContent(successHandler: @escaping (_ responseObject: Array<Genre>?) -> (), errorHandler: @escaping (_ errorObject: NSError?, _ isCancelled: Bool) -> ()){
    
        if self.currentTask == nil || self.currentTask?.state != .running{
            let loading = LoadingPresenter()
            loading.showLoading()
            
            self.currentTask = TMDBGenreClient().getMovieGenres(successHandler: { genres in
                loading.hideLoading()
                successHandler(genres)
            }) { error, isCancelled in
                loading.hideLoading()
                errorHandler(error, isCancelled)
            }
        }
    }
}
