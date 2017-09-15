//
//  ProjectViewModelSpec.swift
//  Teamwork
//
//  Created by Lucas Correa on 15/09/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import  Teamwork

class ProjectViewModelSpec: QuickSpec {
    
    override func spec() {
        
        let projectViewModel: ProjectViewModel = ProjectViewModel()
        
        describe("ProjectViewModel") {
            describe("list projects") {
                it("should invalid authenticate") {
                    
                    Global.authenticate = "Basic 123456"
                    
                    waitUntil(timeout: 60) { done in
                        projectViewModel.list(success: { (success) in
                        },failure: { (response, object, error) in
                            expect(403).to(equal(response!.statusCode))
                            done()
                        })
                    }
                }
                
                it("should return a list projects") {
                    
                    Global.authenticate = "Basic eWF0QHRyaXBsZXNwaW4uY29tOnlhdHlhdHlhdDI3"
                    
                    waitUntil(timeout: 60) { done in
                        projectViewModel.list(success: { (success) in
                            expect(success).toNot(beNil())
                            done()
                        },failure: { (response, object, error) in })
                    }
                }
            }
            
            describe("list tasksList") {
                it("should invalid authenticate") {
                    
                    Global.authenticate = "Basic 123456"
                    
                    waitUntil(timeout: 60) { done in
                        projectViewModel.taskLists(projectId: "339988", success: { (success) in
                        },failure: { (response, object, error) in
                            expect(401).to(equal(response!.statusCode))
                            done()
                        })
                    }
                }
            }
            
        }
    }
}
