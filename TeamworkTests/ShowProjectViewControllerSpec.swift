
//
//  ShowProjectViewControllerSpec.swift
//  Teamwork
//
//  Created by Lucas Correa on 15/09/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import  Teamwork

class ShowProjectViewControllerSpec: QuickSpec {
    
    override func spec() {
        
        let helper = Helper()
        var viewController: ShowProjectViewController!
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        beforeEach {
            
            var projects: [Project?] = []
            
            let obj = helper.readJson(name: "projects")
            for (_, object) in obj.enumerated() {
                let project = Project(fromDictionary:(object as? [String : AnyObject])!)
                projects.append(project)
            }
            
            let storyboard = UIStoryboard(name: "Main",
                                          bundle: Bundle.main)
            viewController = storyboard.instantiateViewController(withIdentifier: "ShowProjectViewController") as! ShowProjectViewController
            viewController.project = projects[0]
            
            window.makeKeyAndVisible()
            window.rootViewController = viewController
        }
        
        describe("ShowProjectViewController") {
            describe(".viewDidLoad") {
                 it("should be presented"){
                    expect(window.rootViewController).toEventually(beAnInstanceOf(ShowProjectViewController.self))
                }
            }
        }
    }
    
    
}
