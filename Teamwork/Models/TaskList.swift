//
//	TaskList.swift
//  Teamwork
//
//	Create by Lucas Correa on 14/9/2017
//  Copyright © 2017 SiriusCode. All rights reserved.

import Foundation

struct TaskList {

	var dlm: String!
	var complete: Bool!
	var descriptionField: String!
	var id: String!
	var isTemplate: Bool!
	var milestoneId: String!
	var name: String!
	var pinned: Bool!
	var position: Int!
	var privateField: Bool!
	var projectId: String!
	var projectName: String!
	var status: String!
	var unCompletedCount: Int!


	init(fromDictionary dictionary: [String:Any]) {
		dlm = dictionary["DLM"] as? String
		complete = dictionary["complete"] as? Bool
		descriptionField = dictionary["description"] as? String
		id = dictionary["id"] as? String
		isTemplate = dictionary["isTemplate"] as? Bool
		milestoneId = dictionary["milestone-id"] as? String
		name = dictionary["name"] as? String
		pinned = dictionary["pinned"] as? Bool
		position = dictionary["position"] as? Int
		privateField = dictionary["private"] as? Bool
		projectId = dictionary["projectId"] as? String
		projectName = dictionary["projectName"] as? String
		status = dictionary["status"] as? String
		unCompletedCount = dictionary["uncompleted-count"] as? Int
	}

	
	func toDictionary() -> [String:Any] {
		var dictionary = [String:Any]()
        
		if dlm != nil {
			dictionary["DLM"] = dlm
		}
        
		if complete != nil {
			dictionary["complete"] = complete
		}
        
		if descriptionField != nil {
			dictionary["description"] = descriptionField
		}
        
		if id != nil {
			dictionary["id"] = id
		}
        
		if isTemplate != nil {
			dictionary["isTemplate"] = isTemplate
		}
        
		if milestoneId != nil {
			dictionary["milestone-id"] = milestoneId
		}
        
		if name != nil {
			dictionary["name"] = name
		}
        
		if pinned != nil {
			dictionary["pinned"] = pinned
		}
        
		if position != nil {
			dictionary["position"] = position
		}
        
		if privateField != nil {
			dictionary["private"] = privateField
		}
        
		if projectId != nil {
			dictionary["projectId"] = projectId
		}
        
		if projectName != nil {
			dictionary["projectName"] = projectName
		}
        
		if status != nil {
			dictionary["status"] = status
		}
        
		if unCompletedCount != nil {
			dictionary["uncompleted-count"] = unCompletedCount
		}
        
		return dictionary
	}

}
