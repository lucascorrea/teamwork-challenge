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
    
    init() {
        projectItems = [Project]()
        
        projectItems.append(Project())
        projectItems.append(Project())
    }
    
}
