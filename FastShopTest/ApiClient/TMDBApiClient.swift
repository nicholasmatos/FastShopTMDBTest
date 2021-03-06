//
//  TMDApiClient.swift
//  FastShopTest
//
//  Created by Nicholas Matos on 2/8/18.
//  Copyright © 2018 Nicholas Matos. All rights reserved.
//

import UIKit
import Alamofire

class TMDBApiClient: NSObject {
    let kDefaultTimeout = 30
    
    var hostUrl : String = TMDBApiSettings.sharedInstance.baseURL + TMDBApiSettings.sharedInstance.version
    
    //MARK: - Create Request
    
    func createRequest(_ url: String, method: HTTPMethod, parameters: [String: String]) -> URLRequest{
        let fullURL = hostUrl + url
        var requestURL : URL!
        
        var mutableParameters = parameters

        mutableParameters["api_key"] = TMDBApiSettings.sharedInstance.apiKey
        
        let parameterString = mutableParameters.stringFromHttpParameters()
        requestURL = URL(string:"\(fullURL)?\(parameterString)")!
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval.init(kDefaultTimeout)
        request.cachePolicy = .reloadIgnoringLocalCacheData
        
        return request
    }
    
    //MARK: - Execute With Handler
    
    func executeWithHandler(_ request: URLRequest, successHandler: @escaping (_ responseObject: AnyObject?) -> (), errorHandler: @escaping (_ errorObject: NSError?, _ isCancelled: Bool) -> ()) -> URLSessionTask {
        
        print("> Calling URL: \(request.url?.absoluteString ?? "")")
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let req = Alamofire.request(request)
            .responseJSON { response in
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                let responseObject = self.handleResponse(response)
                
                if (responseObject.error != nil){
                    print(">> Error calling URL: \(request.url?.absoluteString ?? "")")
                    print(responseObject.error!.code)
                    print(responseObject.error!.domain)
                    
                    errorHandler(responseObject.error, abs(responseObject.error!.code) == 999)
                }else{
                    
                    print("> Success calling URL: \(request.url?.absoluteString ?? "")")
                    
                    successHandler(responseObject.obj!)
                }
        };
        
        return req.task!
    }
    
    //MARK: - Handler Response
    
    func handleResponse(_ response: DataResponse<Any>) -> (obj: NSObject?, error: NSError?){
        switch response.result
        {
        case .success:
            let resultDic = response.result.value as! Dictionary<String,AnyObject>
            return (resultDic as NSObject, nil)
        case .failure(let error):
            return (nil, error as NSError)
        }
    }
}

extension Dictionary {
    
    func stringFromHttpParameters() -> String {
        let parameterArray = self.map { (key, value) -> String in
            let percentEscapedKey = (key as! String)
            let percentEscapedValue = (value as! String)
            
            if (percentEscapedKey == ""){
                return percentEscapedValue
            }
            
            return "\(percentEscapedKey)=\(percentEscapedValue)"
        }
        
        return parameterArray.joined(separator: "&")
    }
}
