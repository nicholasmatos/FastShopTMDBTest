//
//  Movie.swift
//  FastShopTest
//
//  Created by Nicholas Matos on 2/8/18.
//  Copyright © 2018 Nicholas Matos. All rights reserved.
//

import UIKit

class Movie: BaseContent {
    var overview: String?
    var releaseDate: String?
    var voteAverage: Float?
    var backdropImage: String?
    
    override init(data: NSDictionary)
    {
        super.init(data: data)
        
        self.overview = data.object(forKey: "overview") as? String
        self.releaseDate = data.object(forKey: "release_date") as? String
        if let average = data.object(forKey: "vote_average") as? Float{
            self.voteAverage = average
        }else{
            self.voteAverage = 10.0
        }
        self.backdropImage = data.object(forKey: "backdrop_path") as? String
    }
}
