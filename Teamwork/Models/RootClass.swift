//
//	RootClass.swift
//  Teamwork
//
//	Create by Lucas Correa on 14/9/2017
//  Copyright © 2017 SiriusCode. All rights reserved.

import Foundation

struct RootClass{

	var status: String!
	var projects: [Project]!


	init(fromDictionary dictionary: [String:Any]) {
		status = dictionary["STATUS"] as? String
		projects = [Project]()
        
		if let projectsArray = dictionary["projects"] as? [[String:Any]] {
			for dic in projectsArray {
				let value = Project(fromDictionary: dic)
				projects.append(value)
			}
		}
	}

	
	func toDictionary() -> [String:Any] {
		var dictionary = [String:Any]()
        
		if status != nil {
			dictionary["STATUS"] = status
		}
        
		if projects != nil {
			var dictionaryElements = [[String:Any]]()
			for projectsElement in projects {
				dictionaryElements.append(projectsElement.toDictionary())
			}
			dictionary["projects"] = dictionaryElements
		}
        
		return dictionary
	}

}
