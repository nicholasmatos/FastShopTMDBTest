//
//  ViewController.swift
//  FastShopTest
//
//  Created by Nicholas Matos on 2/8/18.
//  Copyright © 2018 Nicholas Matos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        TMDBGenreClient().getMovieGenres(successHandler: { genres in
            
        }) { error, isCancelled in
            
        }
        
        TMDBGenreClient().getMoviesByGenreId(genreId: "16", successHandler: { movies in
            
        }, errorHandler: { error, isCancelled in
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

