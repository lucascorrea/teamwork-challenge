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
    case AddTask(taskListId: String, content: String, description: String)
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
        case .AddTask:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .Projects():
            return "projects.json"
        case .TaskLists(let projectId):
            return "projects/\(projectId)/tasklists.json"
        case .AddTask(let taskListId, _, _):
            return "tasklists/\(taskListId)/tasks.json"
        }
    }
    
    var headers: [String: String]? {
        return ["Accept": "application/json",
                "Content-Type": "application/json",
                "Authorization": Global.authenticate]
        
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .AddTask(_ , let content, let description):
            return [
                "todo-item": [
                    "content": content,
                    "description": description
                ]
            ]
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
        case .AddTask:
            return "\(baseURL)\(path)"
        }
    }
}
