//
//  Network.swift
//  icom
//
//  Created by Lucas Correa on 04/01/17.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

import UIKit
import Alamofire

public typealias SuccessHandler = (AnyObject?) -> Void
public typealias SuccessTupleHandler = (AnyObject?, AnyObject?) -> Void
public typealias FailureHandler = (HTTPURLResponse?, AnyObject?, Error?) -> Void

class Network {
    
    static func request(target: API, success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        
        print(target.url)
 
        Alamofire.request(target.url, method: target.method, parameters: target.parameters, headers: target.headers).validate(statusCode: 200..<300).responseJSON { response in
            if response.result.isFailure {
                
                let value = Network.convertToDictionary(data: response.data!)
                
                failure(response.response, value as AnyObject?, response.result.error)
            } else {
                if let json = response.result.value {
                    success(json as AnyObject?)
                }
            }
        }
    }
    
    static func requestBody(target: API, success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        
        Alamofire.request(target.url, method: target.method, parameters: target.parameters, encoding: JSONEncoding.default, headers: target.headers).validate(statusCode: 200..<300).responseJSON { response in
            
            if response.result.isFailure {
                
                let value = Network.convertToDictionary(data: response.data!)
                
                failure(response.response, value as AnyObject?, response.result.error)
            } else {
                if let json = response.result.value {
                    success(json as AnyObject?)
                }
            }
        }


    }
    
    static func convertToDictionary(data: Data) -> [String: Any]? {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
