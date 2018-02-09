//
//  MainRouter.swift
//  FastShopTest
//
//  Created by Nicholas Matos on 2/9/18.
//  Copyright © 2018 Nicholas Matos. All rights reserved.
//

import UIKit

class MainRouter: NSObject {
    //let appDelegate : AppDelegate =  UIApplication.shared.delegate as! AppDelegate
    
    func showMovieCollection(genreId: String){
        let moviePresenter = MoviePresenter()
        moviePresenter.id = genreId
        moviePresenter.registerDelegate()
        
        if let navigation = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
            navigation.pushViewController(moviePresenter.movieCollection, animated: true)
        }
    }
}
