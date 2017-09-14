//
//	Default.swift
//  Teamwork
//
//	Create by Lucas Correa on 14/9/2017
//  Copyright © 2017 SiriusCode. All rights reserved.

import Foundation

struct Default{

	var privacy: String!


	init(fromDictionary dictionary: [String:Any]) {
		privacy = dictionary["privacy"] as? String
	}

	func toDictionary() -> [String:Any] {
		var dictionary = [String:Any]()
        
		if privacy != nil {
			dictionary["privacy"] = privacy
		}
        
		return dictionary
	}

}
