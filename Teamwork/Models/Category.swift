//
//	Category.swift
//  Teamwork
//
//	Create by Lucas Correa on 14/9/2017
//  Copyright © 2017 SiriusCode. All rights reserved.

import Foundation

struct Category{

	var color: String!
	var id: String!
	var name: String!


	init(fromDictionary dictionary: [String:Any]) {
		color = dictionary["color"] as? String
		id = dictionary["id"] as? String
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
