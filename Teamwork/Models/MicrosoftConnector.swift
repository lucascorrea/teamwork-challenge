//
//	MicrosoftConnector.swift
//  Teamwork
//
//	Create by Lucas Correa on 14/9/2017
//  Copyright © 2017 SiriusCode. All rights reserved.

import Foundation

struct MicrosoftConnector{

	var enabled: Bool!


	init(fromDictionary dictionary: [String:Any]) {
		enabled = dictionary["enabled"] as? Bool
	}

	func toDictionary() -> [String:Any] {
		var dictionary = [String:Any]()
        
		if enabled != nil {
			dictionary["enabled"] = enabled
		}
        
		return dictionary
	}

}
