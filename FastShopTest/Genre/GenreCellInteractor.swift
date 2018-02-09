//
//  GenreCellInteractor.swift
//  FastShopTest
//
//  Created by Nicholas Matos on 2/9/18.
//  Copyright © 2018 Nicholas Matos. All rights reserved.
//

import UIKit

class GenreCellInteractor: NSObject {
    var currentTask: URLSessionTask?
    
    func getMoviesByGenre(id: String, successHandler: @escaping (_ responseObject: Array<Movie>?) -> (), errorHandler: @escaping (_ errorObject: NSError?, _ isCancelled: Bool) -> ()){
        
        if self.currentTask?.state == .running{
            self.currentTask?.cancel()
        }
        
        self.currentTask = TMDBGenreClient().getMoviesByGenreId(genreId: id, successHandler: { movies in
            successHandler(movies)
        }) { error, isCancelled in
            errorHandler(error, isCancelled)
        }
    }
}
