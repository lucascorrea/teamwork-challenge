//
//  Task.swift
//  Teamwork
//
//  Created by Lucas Correa on 14/09/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

struct Task {
    
    var dlm: Int!
    var attachmentsCount: Int!
    var canComplete: Bool!
    var canEdit: Bool!
    var canLogTime: Bool!
    var changeFollowerIds: String!
    var changeFollowerSummary: String!
    var commentFollowerIds: String!
    var commentFollowerSummary: String!
    var commentsCount: Int!
    var companyId: Int!
    var companyName: String!
    var completed: Bool!
    var content: String!
    var createdOn: String!
    var creatorAvatarUrl: String!
    var creatorFirstName: String!
    var creatorId: Int!
    var creatorLastName: String!
    var descriptionField: String!
    var dueDate: String!
    var dueDatebase: String!
    var estimatedMinutes: Int!
    var harvestEnabled: Bool!
    var hasDependencies: Int!
    var hasPredecessors: Int!
    var hasReminders: Bool!
    var hasUnreadComments: Bool!
    var hasTickets: Bool!
    var id: Int!
    var lastChangedOn: String!
    var lockdownId: String!
    var order: Int!
    var parentTaskId: String!
    var position: Int!
    var predecessors: [AnyObject]!
    var priority: String!
    var privateField: Int!
    var progress: Int!
    var projectId: Int!
    var projectName: String!
    var responsiblePartyFirstName: String!
    var responsiblePartyId: String!
    var responsiblePartyIds: String!
    var responsiblePartyLastName: String!
    var responsiblePartyNames: String!
    var responsiblePartySummary: String!
    var responsiblePartyType: String!
    var startDate: String!
    var status: String!
    var tags: [Tag]!
    var taskListIsTemplate: Bool!
    var taskListLockdownId: String!
    var taskListPrivate: Bool!
    var timeIsLogged: String!
    var todoListId: Int!
    var todoListName: String!
    var userFollowingChanges: Bool!
    var userFollowingComments: Bool!
    var viewEstimatedTime: Bool!
    
    
    init(fromDictionary dictionary: [String:Any]) {
        dlm = dictionary["DLM"] as? Int
        attachmentsCount = dictionary["attachments-count"] as? Int
        canComplete = dictionary["canComplete"] as? Bool
        canEdit = dictionary["canEdit"] as? Bool
        canLogTime = dictionary["canLogTime"] as? Bool
        changeFollowerIds = dictionary["changeFollowerIds"] as? String
        changeFollowerSummary = dictionary["changeFollowerSummary"] as? String
        commentFollowerIds = dictionary["commentFollowerIds"] as? String
        commentFollowerSummary = dictionary["commentFollowerSummary"] as? String
        commentsCount = dictionary["comments-count"] as? Int
        companyId = dictionary["company-id"] as? Int
        companyName = dictionary["company-name"] as? String
        completed = dictionary["completed"] as? Bool
        content = dictionary["content"] as? String
        createdOn = dictionary["created-on"] as? String
        creatorAvatarUrl = dictionary["creator-avatar-url"] as? String
        creatorFirstName = dictionary["creator-firstname"] as? String
        creatorId = dictionary["creator-id"] as? Int
        creatorLastName = dictionary["creator-lastname"] as? String
        descriptionField = dictionary["description"] as? String
        dueDate = dictionary["due-date"] as? String
        dueDatebase = dictionary["due-date-base"] as? String
        estimatedMinutes = dictionary["estimated-minutes"] as? Int
        harvestEnabled = dictionary["harvest-enabled"] as? Bool
        hasDependencies = dictionary["has-dependencies"] as? Int
        hasPredecessors = dictionary["has-predecessors"] as? Int
        hasReminders = dictionary["has-reminders"] as? Bool
        hasUnreadComments = dictionary["has-unread-comments"] as? Bool
        hasTickets = dictionary["hasTickets"] as? Bool
        id = dictionary["id"] as? Int
        lastChangedOn = dictionary["last-changed-on"] as? String
        lockdownId = dictionary["lockdownId"] as? String
        order = dictionary["order"] as? Int
        parentTaskId = dictionary["parentTaskId"] as? String
        position = dictionary["position"] as? Int
        predecessors = dictionary["predecessors"] as? [AnyObject]
        priority = dictionary["priority"] as? String
        privateField = dictionary["private"] as? Int
        progress = dictionary["progress"] as? Int
        projectId = dictionary["project-id"] as? Int
        projectName = dictionary["project-name"] as? String
        responsiblePartyFirstName = dictionary["responsible-party-firstname"] as? String
        responsiblePartyId = dictionary["responsible-party-id"] as? String
        responsiblePartyIds = dictionary["responsible-party-ids"] as? String
        responsiblePartyLastName = dictionary["responsible-party-lastname"] as? String
        responsiblePartyNames = dictionary["responsible-party-names"] as? String
        responsiblePartySummary = dictionary["responsible-party-summary"] as? String
        responsiblePartyType = dictionary["responsible-party-type"] as? String
        startDate = dictionary["start-date"] as? String
        status = dictionary["status"] as? String
        tags = [Tag]()
        
        if let tagsArray = dictionary["tags"] as? [[String:Any]]{
            for dic in tagsArray{
                let value = Tag(fromDictionary: dic)
                tags.append(value)
            }
        }
        
        taskListIsTemplate = dictionary["tasklist-isTemplate"] as? Bool
        taskListLockdownId = dictionary["tasklist-lockdownId"] as? String
        taskListPrivate = dictionary["tasklist-private"] as? Bool
        timeIsLogged = dictionary["timeIsLogged"] as? String
        todoListId = dictionary["todo-list-id"] as? Int
        todoListName = dictionary["todo-list-name"] as? String
        userFollowingChanges = dictionary["userFollowingChanges"] as? Bool
        userFollowingComments = dictionary["userFollowingComments"] as? Bool
        viewEstimatedTime = dictionary["viewEstimatedTime"] as? Bool
    }
    
    
    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        
        if dlm != nil {
            dictionary["DLM"] = dlm
        }
        
        if attachmentsCount != nil {
            dictionary["attachments-count"] = attachmentsCount
        }
        
        if canComplete != nil {
            dictionary["canComplete"] = canComplete
        }
        
        if canEdit != nil {
            dictionary["canEdit"] = canEdit
        }
        
        if canLogTime != nil {
            dictionary["canLogTime"] = canLogTime
        }
        
        if changeFollowerIds != nil {
            dictionary["changeFollowerIds"] = changeFollowerIds
        }
        
        if changeFollowerSummary != nil {
            dictionary["changeFollowerSummary"] = changeFollowerSummary
        }
        
        if commentFollowerIds != nil {
            dictionary["commentFollowerIds"] = commentFollowerIds
        }
        
        if commentFollowerSummary != nil {
            dictionary["commentFollowerSummary"] = commentFollowerSummary
        }
        
        if commentsCount != nil {
            dictionary["comments-count"] = commentsCount
        }
        
        if companyId != nil {
            dictionary["company-id"] = companyId
        }
        
        if companyName != nil {
            dictionary["company-name"] = companyName
        }
        
        if completed != nil {
            dictionary["completed"] = completed
        }
        
        if content != nil {
            dictionary["content"] = content
        }
        
        if createdOn != nil {
            dictionary["created-on"] = createdOn
        }
        
        if creatorAvatarUrl != nil {
            dictionary["creator-avatar-url"] = creatorAvatarUrl
        }
        
        if creatorFirstName != nil {
            dictionary["creator-firstname"] = creatorFirstName
        }
        
        if creatorId != nil {
            dictionary["creator-id"] = creatorId
        }
        
        if creatorLastName != nil {
            dictionary["creator-lastname"] = creatorLastName
        }
        
        if descriptionField != nil {
            dictionary["description"] = descriptionField
        }
        
        if dueDate != nil {
            dictionary["due-date"] = dueDate
        }
        
        if dueDatebase != nil {
            dictionary["due-date-base"] = dueDatebase
        }
        
        if estimatedMinutes != nil {
            dictionary["estimated-minutes"] = estimatedMinutes
        }
        
        if harvestEnabled != nil {
            dictionary["harvest-enabled"] = harvestEnabled
        }
        
        if hasDependencies != nil {
            dictionary["has-dependencies"] = hasDependencies
        }
        
        if hasPredecessors != nil {
            dictionary["has-predecessors"] = hasPredecessors
        }
        
        if hasReminders != nil {
            dictionary["has-reminders"] = hasReminders
        }
        
        if hasUnreadComments != nil {
            dictionary["has-unread-comments"] = hasUnreadComments
        }
        
        if hasTickets != nil {
            dictionary["hasTickets"] = hasTickets
        }
        
        if id != nil {
            dictionary["id"] = id
        }
        
        if lastChangedOn != nil {
            dictionary["last-changed-on"] = lastChangedOn
        }
        
        if lockdownId != nil {
            dictionary["lockdownId"] = lockdownId
        }
        
        if order != nil {
            dictionary["order"] = order
        }
        
        if parentTaskId != nil {
            dictionary["parentTaskId"] = parentTaskId
        }
        
        if position != nil {
            dictionary["position"] = position
        }
        
        if predecessors != nil {
            dictionary["predecessors"] = predecessors
        }
        
        if priority != nil {
            dictionary["priority"] = priority
        }
        
        if privateField != nil {
            dictionary["private"] = privateField
        }
        
        if progress != nil {
            dictionary["progress"] = progress
        }
        
        if projectId != nil {
            dictionary["project-id"] = projectId
        }
        
        if projectName != nil {
            dictionary["project-name"] = projectName
        }
        
        if responsiblePartyFirstName != nil {
            dictionary["responsible-party-firstname"] = responsiblePartyFirstName
        }
        
        if responsiblePartyId != nil {
            dictionary["responsible-party-id"] = responsiblePartyId
        }
        
        if responsiblePartyIds != nil {
            dictionary["responsible-party-ids"] = responsiblePartyIds
        }
        
        if responsiblePartyLastName != nil {
            dictionary["responsible-party-lastname"] = responsiblePartyLastName
        }
        
        if responsiblePartyNames != nil {
            dictionary["responsible-party-names"] = responsiblePartyNames
        }
        
        if responsiblePartySummary != nil {
            dictionary["responsible-party-summary"] = responsiblePartySummary
        }
        
        if responsiblePartyType != nil {
            dictionary["responsible-party-type"] = responsiblePartyType
        }
        
        if startDate != nil {
            dictionary["start-date"] = startDate
        }
        
        if status != nil {
            dictionary["status"] = status
        }
        
        if tags != nil {
            var dictionaryElements = [[String:Any]]()
            for tagsElement in tags {
                dictionaryElements.append(tagsElement.toDictionary())
            }
            dictionary["tags"] = dictionaryElements
        }
        
        if taskListIsTemplate != nil {
            dictionary["tasklist-isTemplate"] = taskListIsTemplate
        }
        
        if taskListLockdownId != nil {
            dictionary["tasklist-lockdownId"] = taskListLockdownId
        }
        
        if taskListPrivate != nil {
            dictionary["tasklist-private"] = taskListPrivate
        }
        
        if timeIsLogged != nil {
            dictionary["timeIsLogged"] = timeIsLogged
        }
        
        if todoListId != nil {
            dictionary["todo-list-id"] = todoListId
        }
        
        if todoListName != nil {
            dictionary["todo-list-name"] = todoListName
        }
        
        if userFollowingChanges != nil {
            dictionary["userFollowingChanges"] = userFollowingChanges
        }
        
        if userFollowingComments != nil {
            dictionary["userFollowingComments"] = userFollowingComments
        }
        
        if viewEstimatedTime != nil {
            dictionary["viewEstimatedTime"] = viewEstimatedTime
        }
        
        return dictionary
    }
    
}
