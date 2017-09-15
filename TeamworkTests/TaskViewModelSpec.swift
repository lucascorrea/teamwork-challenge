//
//  TaskViewModelSpec.swift
//  Teamwork
//
//  Created by Lucas Correa on 15/09/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import  Teamwork

class TaskViewModelSpec: QuickSpec {
    
    override func spec() {
        
        let taskViewModel: TaskViewModel = TaskViewModel()
        
        describe("TaskViewModel") {
            describe("list task") {
                it("should invalid authenticate") {
                    
                    Global.authenticate = "Basic 123456"
                    
                    waitUntil(timeout: 60) { done in
                        
                        taskViewModel.addTask(taskListId: "1115157", content: "Test Quick and Nimble", description: "Unit Test - Lucas Correa", success: { (success) in
                        }, failure: { (response, object, error) in
                            expect(403).to(equal(response!.statusCode))
                            done()
                        })
                    }
                }
                
                it("should add a task to project") {
                    
                    Global.authenticate = "Basic eWF0QHRyaXBsZXNwaW4uY29tOnlhdHlhdHlhdDI3"
                    
                    waitUntil(timeout: 60) { done in
                        
                        taskViewModel.addTask(taskListId: "1115157", content: "Test Quick and Nimble", description: "Unit Test - Lucas Correa", success: { (success) in
                            expect(success).toNot(beNil())
                            done()
                        }, failure: { (response, object, error) in
                        })
                    }
                }
            }
        }
    }
    
}
