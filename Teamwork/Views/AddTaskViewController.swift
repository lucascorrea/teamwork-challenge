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
    fileprivate let taskViewModel: TaskViewModel = TaskViewModel()
    
    var project: Project?
    var taskList: Tasklist?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.projectLabel.text = project!.name
        
        //BarButton save
        let saveButton = UIButton(type: .custom)
        saveButton.setTitle(save, for: .normal)
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
                let alert = UIAlertController(title: weHaveAProblem, message: noExistTaskList, preferredStyle: .alert)
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
    
    func validateForm() -> Bool {
        var check = true
        
        if self.titleText.text?.lengthOfBytes(using: .utf8) == 0 {
            check = false
        }
        
        if self.taskList == nil {
            check = false
        }
        
        if self.project == nil {
            check = false
        }
        
        if !check {
            let alert = UIAlertController(title: moreInformation, message: validateFormTask, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        return check
    }
    
    func addTask(_ sender: Any) {
        
        if !validateForm() {
            return;
        }
        
        //Loading
        let loadingView = RSLoadingView()
        loadingView.dimBackgroundColor = loadingColor
        loadingView.show(on: self.view)
        
        // Request all taskLists
        taskViewModel.addTask(taskListId: taskList!.id!, content: self.titleText.text!, description: self.descriptionTextView.text!, success: { (success) in
            RSLoadingView.hide(from: self.view)

            if self.taskViewModel.isStatusOK {
                
                let alertController = UIAlertController(title: alert, message: addedTask, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertController, animated: true, completion: {})
                
                delay(1) {
                    self.navigationController?.popViewController(animated: true)
                }
                
            } else {
                let alertController = UIAlertController(title: weHaveAProblem, message: errorInsertTask, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
            
        }) { (response, object, error) in
            RSLoadingView.hide(from: self.view)
        }

    }
    
}
