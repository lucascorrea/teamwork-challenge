//
//  Alamofire+Body.swift
//  Teamwork
//
//  Created by Lucas Correa on 14/09/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

import Foundation
import Alamofire

extension SessionManager {
    
    struct CustomEncoding: ParameterEncoding {
        func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
            var request = try! URLEncoding().encode(urlRequest, with: parameters)
            let urlString = request.url?.absoluteString.replacingOccurrences(of: "%5B%5D=", with: "=")
            request.url = URL(string: urlString!)
            return request
        }
    }
    
    public class func request2(method: Alamofire.HTTPMethod,_ URLString: URLConvertible, bodyObject: AnyObject) -> Request {
        return Alamofire.request(
            URLString,
            method: method,
            parameters: [:],
            encoding: CustomEncoding()
        )
    }}
