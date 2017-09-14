//
//	Project.swift
//  Teamwork
//
//	Create by Lucas Correa on 14/9/2017
//  Copyright © 2017 SiriusCode. All rights reserved.

import Foundation

struct Project {
    
    var announcement: String!
    var announcementHTML: String!
    var boardData: BoardData!
    var category: Category!
    var company: Company!
    var createdOn: String!
    var defaultPrivacy: String!
    var defaults: Default!
    var descriptionField: String!
    var endDate: String!
    var filesAutoNewVersion: Bool!
    var harvestTimersEnabled: Bool!
    var id: String!
    var integrations: Integration!
    var isProjectAdmin: Bool!
    var lastChangedOn: String!
    var logo: String!
    var name: String!
    var notifyEveryone: Bool!
    var overviewStartPage: String!
    var privacyEnabled: Bool!
    var replyByEmailEnabled: Bool!
    var showAnnouncement: Bool!
    var starred: Bool!
    var startPage: String!
    var startDate: String!
    var status: String!
    var subStatus: String!
    var tags: [AnyObject]!
    var tasksStartPage: String!
    
    
    init(fromDictionary dictionary: [String:Any]) {
        announcement = dictionary["announcement"] as? String
        announcementHTML = dictionary["announcementHTML"] as? String
        
        if let boardDataData = dictionary["boardData"] as? [String:Any] {
            boardData = BoardData(fromDictionary: boardDataData)
        }
        
        if let categoryData = dictionary["category"] as? [String:Any] {
            category = Category(fromDictionary: categoryData)
        }
        
        if let companyData = dictionary["company"] as? [String:Any] {
            company = Company(fromDictionary: companyData)
        }
        
        createdOn = dictionary["created-on"] as? String
        defaultPrivacy = dictionary["defaultPrivacy"] as? String
        
        if let defaultsData = dictionary["defaults"] as? [String:Any] {
            defaults = Default(fromDictionary: defaultsData)
        }
        
        descriptionField = dictionary["description"] as? String
        endDate = dictionary["endDate"] as? String
        filesAutoNewVersion = dictionary["filesAutoNewVersion"] as? Bool
        harvestTimersEnabled = dictionary["harvest-timers-enabled"] as? Bool
        id = dictionary["id"] as? String
        
        if let integrationsData = dictionary["integrations"] as? [String:Any] {
            integrations = Integration(fromDictionary: integrationsData)
        }
        
        isProjectAdmin = dictionary["isProjectAdmin"] as? Bool
        lastChangedOn = dictionary["last-changed-on"] as? String
        logo = dictionary["logo"] as? String
        name = dictionary["name"] as? String
        notifyEveryone = dictionary["notifyeveryone"] as? Bool
        overviewStartPage = dictionary["overview-start-page"] as? String
        privacyEnabled = dictionary["privacyEnabled"] as? Bool
        replyByEmailEnabled = dictionary["replyByEmailEnabled"] as? Bool
        showAnnouncement = dictionary["show-announcement"] as? Bool
        starred = dictionary["starred"] as? Bool
        startPage = dictionary["start-page"] as? String
        startDate = dictionary["startDate"] as? String
        status = dictionary["status"] as? String
        subStatus = dictionary["subStatus"] as? String
        tags = dictionary["tags"] as? [AnyObject]
        tasksStartPage = dictionary["tasks-start-page"] as? String
    }
    

    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        
        if announcement != nil {
            dictionary["announcement"] = announcement
        }
        
        if announcementHTML != nil {
            dictionary["announcementHTML"] = announcementHTML
        }
        
        if boardData != nil {
            dictionary["boardData"] = boardData.toDictionary()
        }
        
        if category != nil {
            dictionary["category"] = category.toDictionary()
        }
        
        if company != nil {
            dictionary["company"] = company.toDictionary()
        }
        
        if createdOn != nil {
            dictionary["created-on"] = createdOn
        }
        
        if defaultPrivacy != nil {
            dictionary["defaultPrivacy"] = defaultPrivacy
        }
        
        if defaults != nil {
            dictionary["defaults"] = defaults.toDictionary()
        }
        
        if descriptionField != nil {
            dictionary["description"] = descriptionField
        }
        
        if endDate != nil {
            dictionary["endDate"] = endDate
        }
        
        if filesAutoNewVersion != nil {
            dictionary["filesAutoNewVersion"] = filesAutoNewVersion
        }
        
        if harvestTimersEnabled != nil {
            dictionary["harvest-timers-enabled"] = harvestTimersEnabled
        }
        
        if id != nil {
            dictionary["id"] = id
        }
        
        if integrations != nil {
            dictionary["integrations"] = integrations.toDictionary()
        }
        
        if isProjectAdmin != nil {
            dictionary["isProjectAdmin"] = isProjectAdmin
        }
        
        if lastChangedOn != nil {
            dictionary["last-changed-on"] = lastChangedOn
        }
        
        if logo != nil {
            dictionary["logo"] = logo
        }
        
        if name != nil {
            dictionary["name"] = name
        }
        
        if notifyEveryone != nil {
            dictionary["notifyeveryone"] = notifyEveryone
        }
        
        if overviewStartPage != nil {
            dictionary["overview-start-page"] = overviewStartPage
        }
        
        if privacyEnabled != nil {
            dictionary["privacyEnabled"] = privacyEnabled
        }
        
        if replyByEmailEnabled != nil {
            dictionary["replyByEmailEnabled"] = replyByEmailEnabled
        }
        
        if showAnnouncement != nil {
            dictionary["show-announcement"] = showAnnouncement
        }
        
        if starred != nil {
            dictionary["starred"] = starred
        }
        
        if startPage != nil {
            dictionary["start-page"] = startPage
        }
        
        if startDate != nil {
            dictionary["startDate"] = startDate
        }
        
        if status != nil {
            dictionary["status"] = status
        }
        
        if subStatus != nil {
            dictionary["subStatus"] = subStatus
        }
        
        if tags != nil {
            dictionary["tags"] = tags
        }
        
        if tasksStartPage != nil {
            dictionary["tasks-start-page"] = tasksStartPage
        }
        
        return dictionary
    }
    
}
