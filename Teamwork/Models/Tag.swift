//
//  Tag.swift
//  Teamwork
//
//  Created by Lucas Correa on 14/09/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

import Foundation

struct Tag {
    
    var color: String!
    var id: Int!
    var name: String!
    
    init(fromDictionary dictionary: [String:Any]) {
        color = dictionary["color"] as? String
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
    }
    
    
    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        
        if color != nil {
            dictionary["color"] = color
        }
        
        if id != nil {
            dictionary["id"] = id
        }
        
        if name != nil {
            dictionary["name"] = name
        }
        
        return dictionary
    }
    
}
