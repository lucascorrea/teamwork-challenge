//
//  ProjectViewController.swift
//  Teamwork
//
//  Created by Lucas Correa on 13/09/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

import UIKit

class ProjectViewController: UIViewController {
    
    let projectViewModel: ProjectViewModel = ProjectViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupBarButton(viewController: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// MARK: - UITableViewDataSource
extension ProjectViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.projectViewModel.projectItems.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ProjectCell = (tableView.dequeueReusableCell(withIdentifier: "ProjectCell", for: indexPath) as? ProjectCell)!
        
        let project = self.projectViewModel.projectItems[indexPath.row]
        cell.configureCell(project: project)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ProjectViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 90
//    }
}
