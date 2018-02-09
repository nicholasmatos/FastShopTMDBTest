//
//  Genre.swift
//  FastShopTest
//
//  Created by Nicholas Matos on 2/8/18.
//  Copyright © 2018 Nicholas Matos. All rights reserved.
//

import UIKit

class Genre: NSObject {
    var id: String?
    var name: String?
    
    init(data: NSDictionary)
    {
        super.init()
        
        if let id = data.object(forKey: "id") {
            self.id = String(describing: id)
        }
        self.name = data.object(forKey: "name") as? String
    }
}
