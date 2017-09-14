//
//  ProjectViewController.swift
//  Teamwork
//
//  Created by Lucas Correa on 13/09/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

import UIKit
import SwipeCellKit
import RSLoadingView

class ProjectViewController: UIViewController {
    
    @IBOutlet weak var projectTableView: UITableView!
    fileprivate let defaultOptions = SwipeTableOptions()
    fileprivate let buttonDisplayMode: ButtonDisplayMode = .titleAndImage
    fileprivate let buttonStyle: ButtonStyle = .backgroundColor
    fileprivate let projectViewModel: ProjectViewModel = ProjectViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupMenuBarButton(viewController: self)
        
        //Loading
        let loadingView = RSLoadingView()
        loadingView.dimBackgroundColor = loadingColor
        loadingView.show(on: self.view)
        
        // Request all projects
        projectViewModel.list(success: { (success) in
             RSLoadingView.hide(from: self.view)
            self.projectTableView.reloadData()
        }) { (response, object, error) in
             RSLoadingView.hide(from: self.view)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// MARK: - UIStoryboardSegue
extension ProjectViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addTaskSegue" {
            let viewController = segue.destination as? AddTaskViewController
            viewController?.project = sender as? Project
        }
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
        cell.delegate = self
        cell.configureCell(project: project)
        
        return cell
    }
}


// MARK: - UITableViewDelegate
extension ProjectViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


// MARK: - SwipeTableViewCellDelegate
extension ProjectViewController: SwipeTableViewCellDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        
        if orientation == .right {
            
            // Action Task
            let task = SwipeAction(style: .default, title: nil) { action, indexPath in
                let project = self.projectViewModel.projectItems[indexPath.row]
                self.performSegue(withIdentifier: "addTaskSegue", sender: project)
            }
            task.hidesWhenSelected = true
            configure(action: task, with: .task)
            
            // Action Remove
            let delete = SwipeAction(style: .destructive, title: nil) { action, indexPath in
                
                self.projectViewModel.projectItems.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .right)
            }
            delete.hidesWhenSelected = true
            configure(action: delete, with: .remove)
            
            return [delete, task]
        }
        
        return []
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeTableOptions {
        var options = SwipeTableOptions()
        //options.expansionStyle = orientation == .left ? .selection : .destructive
        options.transitionStyle = defaultOptions.transitionStyle
        
        switch buttonStyle {
        case .backgroundColor:
            options.buttonSpacing = 11
        case .circular:
            options.buttonSpacing = 4
            options.backgroundColor = #colorLiteral(red: 0.9467939734, green: 0.9468161464, blue: 0.9468042254, alpha: 1)
        }
        
        return options
    }
    
    func configure(action: SwipeAction, with descriptor: ActionDescriptor) {
        action.title = descriptor.title(forDisplayMode: buttonDisplayMode)
        
        switch buttonStyle {
        case .backgroundColor:
            action.backgroundColor = descriptor.color
        case .circular:
            action.backgroundColor = .clear
            action.textColor = descriptor.color
            action.font = .systemFont(ofSize: 13)
            action.transitionDelegate = ScaleTransition.default
        }
    }
}


//
// MARK: - Enums
enum ActionDescriptor {
    case task, remove
    
    func title(forDisplayMode displayMode: ButtonDisplayMode) -> String? {
        guard displayMode != .imageOnly else { return nil }
        
        switch self {
        case .task: return "Add Task"
        case .remove: return "Remove Project"
        }
    }
    
    var color: UIColor {
        switch self {
        case .task: return #colorLiteral(red: 0, green: 0.4577052593, blue: 1, alpha: 1)
        case .remove: return #colorLiteral(red: 1, green: 0.2352941176, blue: 0.1882352941, alpha: 1)
        }
    }
}
enum ButtonDisplayMode {
    case titleAndImage, titleOnly, imageOnly
}

enum ButtonStyle {
    case backgroundColor, circular
}

