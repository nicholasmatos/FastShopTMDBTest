//
//  TMDBMovieClient.swift
//  FastShopTest
//
//  Created by Nicholas Matos on 2/8/18.
//  Copyright © 2018 Nicholas Matos. All rights reserved.
//

import UIKit

class TMDBMovieClient: NSObject {
    
    //MARK: - Get Movie Detail
    
    func getMovieDetail(id: String, successHandler: @escaping (_ responseObject: Movie?) -> (), errorHandler: @escaping (_ errorObject: NSError?, _ isCancelled: Bool) -> ()) -> URLSessionTask
    {
        let url = "movie/\(id)"
        let parameters: [String: String] = [:]
        
        let request = TMDBApiClient().createRequest(url, method: .get, parameters: parameters)
        return TMDBApiClient().executeWithHandler(request, successHandler: { data in
            successHandler(Movie.init(data: data as! NSDictionary))
        }, errorHandler: errorHandler)
    }
    
    //MARK: - Parse Movie List
    
    class func parseMovieList(data: NSDictionary) -> Array<Movie>?{
        var movies = [Movie]()
        
        if let arrayMovies: NSArray = data.object(forKey: "results") as? NSArray {
            for value in arrayMovies{
                movies.append(Movie.init(data: value as! NSDictionary))
            }
        }
        
        return movies
    }
}
