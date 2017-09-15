//
//  ProjectViewModel.swift
//  Teamwork
//
//  Created by Lucas Correa on 13/09/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

import Foundation
import UIKit

class ProjectViewModel {
    
    var projectItems: [Project]
    var taskListItems: [TaskList]
    
    init() {
        projectItems = [Project]()
        taskListItems = [TaskList]()
    }
    
    //
    // MARK: - Functions
    func list(success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        
        let request = API.Projects()
        Network.request(target: request, success: { (response) in
            
            guard let value = response as? [String: AnyObject] else {
                print("Response not dictionary")
                success(nil)
                return
            }
            
            self.projectItems.removeAll()
            let array = ((value as AnyObject)["projects"] as? NSArray)!
            
            for (_, object) in array.enumerated() {
                let project = Project(fromDictionary:(object as? [String : AnyObject])!)
                self.projectItems.append(project)
            }
            
            success(self)
        }, failure: { (response, object, error) in
            failure(response, object, error)
        })
        
    }
    
    
    func taskLists(projectId: String, success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        
        let request = API.TaskLists(projectId: projectId)
        Network.request(target: request, success: { (response) in
            
            guard let value = response as? [String: AnyObject] else {
                print("Response not dictionary")
                success(nil)
                return
            }
            
            self.taskListItems.removeAll()
            let array = ((value as AnyObject)["tasklists"] as? NSArray)!
            
            for (_, object) in array.enumerated() {
                let taskList = TaskList(fromDictionary:(object as? [String : AnyObject])!)
                self.taskListItems.append(taskList)
            }
            
            success(self)
        }, failure: { (response, object, error) in
            failure(response, object, error)
        })
        
    }

}
