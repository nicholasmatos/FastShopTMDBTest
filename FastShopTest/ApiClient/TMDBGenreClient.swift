//
//  TMDBGenreClient.swift
//  FastShopTest
//
//  Created by Nicholas Matos on 2/8/18.
//  Copyright © 2018 Nicholas Matos. All rights reserved.
//

import UIKit

class TMDBGenreClient: NSObject {

    //MARK: - Get Movie List By Genre ID
    
    func getMoviesByGenreId(genreId: String, successHandler: @escaping (_ responseObject: Array<Movie>?) -> (), errorHandler: @escaping (_ errorObject: NSError?, _ isCancelled: Bool) -> ()) -> URLSessionTask
    {
        let url = "genre/\(genreId)/movies"
        let parameters: [String: String] = [:]
        
        let request = TMDBApiClient().createRequest(url, method: .get, parameters: parameters)
        return TMDBApiClient().executeWithHandler(request, successHandler: { data in
            successHandler(TMDBMovieClient.parseMovieList(data: data as! NSDictionary))
        }, errorHandler: errorHandler)
    }
    
    //MARK: - Get All Movie Genres
    
    func getMovieGenres(successHandler: @escaping (_ responseObject: Array<Genre>?) -> (), errorHandler: @escaping (_ errorObject: NSError?, _ isCancelled: Bool) -> ()) -> URLSessionTask
    {
        let url = "genre/movie/list"
        let parameters: [String: String] = [:]
        
        let request = TMDBApiClient().createRequest(url, method: .get, parameters: parameters)
        return TMDBApiClient().executeWithHandler(request, successHandler: { data in
            successHandler(TMDBGenreClient.parseGenre(data: data as! NSDictionary))
        }, errorHandler: errorHandler)
    }
    
    //MARK: - Parse Genres
    
    class func parseGenre(data: NSDictionary) -> Array<Genre>?{
        var genres = [Genre]()
        
        let arrayGenre: NSArray = data.object(forKey: "genres") as! NSArray
        
        for value in arrayGenre{
            genres.append(Genre.init(data: value as! NSDictionary))
        }
        
        return genres
    }
}
