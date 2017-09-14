//
//  API.swift
//  icom
//
//  Created by Lucas Correa on 04/01/17.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

import Foundation
import Alamofire

enum API {
    case Projects()
    case TaskLists(projectId: String)
}

extension API {
    
    var baseURL: NSURL {
        return NSURL(string: "https://yat.teamwork.com/")!
    }
    
    var method: HTTPMethod {
        switch self {
        case .Projects:
            return .get
        case .TaskLists:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .Projects():
            return "projects.json"
        case .TaskLists(let projectId):
            return "projects/\(projectId)/tasklists.json"
        }
    }
    
    var headers: [String: String]? {
        return ["Accept": "application/json",
                "Content-Type": "application/json",
                "Authorization": "Basic eWF0QHRyaXBsZXNwaW4uY29tOnlhdHlhdHlhdDI3"]
    }
    
    var parameters: [String: Any]? {
        switch self {
        
        default :
            return nil
        }
    }
    
    var url: String {
        switch self {
        case .Projects:
            return "\(baseURL)\(path)"
        case .TaskLists:
            return "\(baseURL)\(path)"
        }
    }
}
