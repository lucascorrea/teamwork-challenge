//
//	Onedrivebusines.swift
//  Teamwork
//
//	Create by Lucas Correa on 14/9/2017
//  Copyright © 2017 SiriusCode. All rights reserved.

import Foundation

struct OneDriveBusiness{

	var account: String!
	var enabled: Bool!
	var folder: String!
	var foldername : String!


	init(fromDictionary dictionary: [String:Any]) {
		account = dictionary["account"] as? String
		enabled = dictionary["enabled"] as? Bool
		folder = dictionary["folder"] as? String
		foldername = dictionary["foldername"] as? String
	}

	func toDictionary() -> [String:Any] {
		var dictionary = [String:Any]()
        
		if account != nil {
			dictionary["account"] = account
		}
        
		if enabled != nil {
			dictionary["enabled"] = enabled
		}
        
		if folder != nil {
			dictionary["folder"] = folder
		}
        
		if foldername != nil {
			dictionary["foldername"] = foldername
		}
        
		return dictionary
	}

}
