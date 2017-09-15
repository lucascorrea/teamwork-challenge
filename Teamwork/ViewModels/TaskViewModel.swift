//
//  TaskViewModel.swift
//  Teamwork
//
//  Created by Lucas Correa on 14/09/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

import Foundation

class TaskViewModel {
    
    var taskItems: [Task]
    var isStatusOK: Bool
    
    init() {
        taskItems = [Task]()
        isStatusOK = false
    }
    
    //
    // MARK: - Functions
    func list(success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        
    }
    
    //
    // MARK: - Functions
    func addTask(taskListId: String, content: String, description: String, success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        
        let request = API.AddTask(taskListId: taskListId, content: content, description: description)
        Network.requestBody(target: request, success: { (response) in
            
            guard let value = response as? [String: AnyObject] else {
                print("Response not dictionary")
                success(nil)
                return
            }
            
            let dic = ((value as AnyObject) as? NSDictionary)!
            
            self.isStatusOK = (dic["STATUS"] as? String) == "OK"
            
            success(self)
        }, failure: { (response, object, error) in
            failure(response, object, error)
        })
        
    }
}
