//
//  ModelsSpec.swift
//  Teamwork
//
//  Created by Lucas Correa on 15/09/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import  Teamwork

class ModelsSpec: QuickSpec {
    
    override func spec() {
        
    let helper = Helper()
        
        describe("Model") {
            context("should test project and sub classes") {
                var projects: [Project?] = []
                
                beforeEach {
                    let obj = helper.readJson(name: "projects")
                    for (_, object) in obj.enumerated() {
                        let project = Project(fromDictionary:(object as? [String : AnyObject])!)
                        projects.append(project)
                    }
                }
                
                describe("Project") {
                    it("should exists toDictionary") {
                        for project in projects {
                            expect(project?.toDictionary()).toNot(beNil())
                        }
                    }
                }
                
                describe("Category") {
                    it("should exists toDictionary") {
                        for project in projects {
                            let category = project?.category
                            expect(category?.toDictionary()).toNot(beNil())
                        }
                    }
                }
                
            }
            
            context("should test taskList and sub classes") {
                var taskLists: [TaskList?] = []
                
                beforeEach {
                    let obj = helper.readJson(name: "tasklists")
                    for (_, object) in obj.enumerated() {
                        let taskList = TaskList(fromDictionary:(object as? [String : AnyObject])!)
                        taskLists.append(taskList)
                    }
                }
                
                describe("TaskList") {
                    it("should exists toDictionary") {
                        for taskList in taskLists {
                            expect(taskList?.toDictionary()).toNot(beNil())
                        }
                    }
                }
            }
            
            context("should test task and sub classes") {
                var tasks: [Task?] = []
                
                beforeEach {
                    let obj = helper.readJson(name: "todo-items")
                    for (_, object) in obj.enumerated() {
                        let task = Task(fromDictionary:(object as? [String : AnyObject])!)
                        tasks.append(task)
                    }
                }
                
                describe("Task") {
                    it("should exists toDictionary") {
                        for task in tasks {
                            expect(task?.toDictionary()).toNot(beNil())
                        }
                    }
                    
                    it("should exists tag toDictionary") {
                        for task in tasks {
                            for tag in (task?.tags)! {
                                expect(tag.toDictionary()).toNot(beNil())
                            }
                        }
                    }
                }
            }
        }
    }
}
