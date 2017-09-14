//
//  AddTaskViewController.swift
//  Teamwork
//
//  Created by Lucas Correa on 14/09/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

import UIKit
import RSLoadingView

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var projectLabel: UILabel!
    @IBOutlet weak var taskListLabel: UILabel!
    
    fileprivate let projectViewModel: ProjectViewModel = ProjectViewModel()
    
    var project: Project?
    var taskList: Tasklist?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.projectLabel.text = project!.name
        
        let saveButton = UIButton(type: .custom)
        saveButton.setTitle("Save", for: .normal)
        saveButton.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        saveButton.addTarget(self, action: #selector(addTask(_:)), for: .touchUpInside)
        let saveBarButton = UIBarButtonItem(customView: saveButton)
        
        self.navigationItem.setRightBarButtonItems([saveBarButton], animated: true)
        
        //Loading
        let loadingView = RSLoadingView()
        loadingView.dimBackgroundColor = loadingColor
        loadingView.show(on: self.view)
        
        // Request all taskLists
        projectViewModel.taskLists(projectId: project!.id, success: { (success) in
            RSLoadingView.hide(from: self.view)
            
            //Since it's a demo I did not implement a taskList selection, I'll take the first case there.
            if self.projectViewModel.taskListItems.count > 0 {
                self.taskList = self.projectViewModel.taskListItems[0]
                self.taskListLabel.text = self.taskList!.name
            } else {
                let alert = UIAlertController(title: "Alert", message: "No exist taskList", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }) { (response, object, error) in
            RSLoadingView.hide(from: self.view)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //
    // MARK: - Functions
    func addTask(_ sender: Any) {
        print("passou")
    }
    
}
