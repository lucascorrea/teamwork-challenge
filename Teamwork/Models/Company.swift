//
//	Company.swift
//  Teamwork
//
//	Create by Lucas Correa on 14/9/2017
//  Copyright © 2017 SiriusCode. All rights reserved.

import Foundation

struct Company{

	var id: String!
	var isOwner: String!
	var name: String!


	init(fromDictionary dictionary: [String:Any]) {
		id = dictionary["id"] as? String
		isOwner = dictionary["is-owner"] as? String
		name = dictionary["name"] as? String
	}

	func toDictionary() -> [String:Any] {
		var dictionary = [String:Any]()
        
		if id != nil {
			dictionary["id"] = id
		}
        
		if isOwner != nil {
			dictionary["is-owner"] = isOwner
		}
        
		if name != nil {
			dictionary["name"] = name
		}
        
		return dictionary
	}

}
