//
//	Integration.swift
//  Teamwork
//
//	Create by Lucas Correa on 14/9/2017
//  Copyright © 2017 SiriusCode. All rights reserved.

import Foundation

struct Integration{

	var microsoftConnectors: MicrosoftConnector!
	var oneDriveBusiness: OneDriveBusiness!


	init(fromDictionary dictionary: [String:Any]) {
		if let microsoftConnectorsData = dictionary["microsoftConnectors"] as? [String:Any] {
				microsoftConnectors = MicrosoftConnector(fromDictionary: microsoftConnectorsData)
			}
        
		if let onedrivebusinessData = dictionary["onedrivebusiness"] as? [String:Any] {
				oneDriveBusiness = OneDriveBusiness(fromDictionary: onedrivebusinessData)
			}
	}

	func toDictionary() -> [String:Any] {
		var dictionary = [String:Any]()
        
		if microsoftConnectors != nil {
			dictionary["microsoftConnectors"] = microsoftConnectors.toDictionary()
		}
        
		if oneDriveBusiness != nil {
			dictionary["onedrivebusiness"] = oneDriveBusiness.toDictionary()
		}
        
		return dictionary
	}

}
