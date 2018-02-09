//
//  BaseContent.swift
//  FastShopTest
//
//  Created by Nicholas Matos on 2/9/18.
//  Copyright © 2018 Nicholas Matos. All rights reserved.
//

import UIKit

class BaseContent: NSObject {
    
    var id: String?
    var title: String?
    var posterImage: String?
    
    init(data: NSDictionary)
    {
        super.init()
        
        if let id = data.object(forKey: "id") {
            self.id = String(describing: id)
        }
        self.title = data.object(forKey: "title") as? String
        self.posterImage = data.object(forKey: "poster_path") as? String
    }
}
