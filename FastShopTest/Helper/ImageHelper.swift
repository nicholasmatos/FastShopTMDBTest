//
//  ImageHelper.swift
//  FastShopTest
//
//  Created by Nicholas Matos on 2/9/18.
//  Copyright © 2018 Nicholas Matos. All rights reserved.
//

import UIKit

class ImageHelper: NSObject {
    class func getImageUrl(widthSize: String, suffix: String) -> String{
        return TMDBApiSettings.sharedInstance.baseImageURL + "w\(widthSize)" + suffix
    }
}
