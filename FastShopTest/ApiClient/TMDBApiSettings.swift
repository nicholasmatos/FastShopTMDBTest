//
//  TMDApiSettings.swift
//  FastShopTest
//
//  Created by Nicholas Matos on 2/8/18.
//  Copyright © 2018 Nicholas Matos. All rights reserved.
//

import UIKit

class TMDBApiSettings: NSObject {

    static let sharedInstance = TMDBApiSettings()
    
    var version: String!
    var apiKey: String!
    var baseURL: String!
    var baseImageURL: String!
    
    override init() {
        super.init()
        
        self.loadAllItens()
    }
    
    func getApiSettingsItem(_ item :String) -> AnyObject
    {
        let filePath = Bundle.main.path(forResource: "TMDBApiSettings", ofType: "plist")!
        let stylesheet : NSDictionary! = NSDictionary(contentsOfFile:filePath)
        
        return stylesheet.object(forKey: item)! as AnyObject
    }
    
    //MARK: - Settings of The Movie DB
    
    func loadAllItens() {
        self.version = self.getApiSettingsItem("version") as! String
        self.apiKey  = self.getApiSettingsItem("apiKey") as! String
        self.baseURL = self.getApiSettingsItem("baseURL") as! String
        self.baseImageURL = self.getApiSettingsItem("baseImageURL") as! String
    }
}
