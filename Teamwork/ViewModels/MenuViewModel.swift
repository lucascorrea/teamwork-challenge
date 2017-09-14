//
//  MenuViewModel.swift
//  Teamwork
//
//  Created by Lucas Correa on 13/09/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

import Foundation
import UIKit

class MenuViewModel {
    
    var menuItems: [String]
    fileprivate var indexPathSelect: IndexPath
    fileprivate var colorSelected = UIColor(red: 54 / 255.0, green: 68 / 255.0, blue: 94 / 255.0, alpha: 1.0)
    
    init() {
        indexPathSelect = IndexPath(row: 0, section: 0)
        
        self.menuItems = [String]()
        self.menuItems.append("Projects")
        self.menuItems.append("Tasks")
    }
    
    //
    // MARK: - Functions
    func configureCell(cell: inout MenuCell, indexPath: IndexPath) {
        let menu = self.menuItems[indexPath.row]
        cell.nameLabel.text = menu
        
        if indexPath.row == indexPathSelect.row {
            cell.nameLabel.textColor = colorSelected
        }
    }
    
    func didSelect(tableView: UITableView, indexPath: IndexPath, viewController: UIViewController) {
        
        if indexPath.row == indexPathSelect.row {
            viewController.sideMenuViewController?.hideMenuViewController()
            return
        }
        
        // Reset the previous cell to the default color
        let cell: MenuCell = (tableView.cellForRow(at: indexPathSelect) as? MenuCell)!
        cell.nameLabel.textColor = UIColor.white
        
        indexPathSelect = indexPath
        
        // Apply color to selected cell
        let cellSelect: MenuCell = (tableView.cellForRow(at: indexPathSelect) as? MenuCell)!
        cellSelect.nameLabel.textColor = colorSelected
        
        switch indexPath.row {
            
        // Projects
        case 0:
            let vc = viewController.storyboard?.instantiateViewController(withIdentifier: "ProjectNavigationController")
            viewController.sideMenuViewController?.contentViewController = vc
            viewController.sideMenuViewController?.hideMenuViewController()
            break
            
        //Tasks
        case 1:
            let vc = viewController.storyboard?.instantiateViewController(withIdentifier: "TaskNavigationController")
            viewController.sideMenuViewController?.contentViewController = vc
            viewController.sideMenuViewController?.hideMenuViewController()
            break
            
        default:
            break
        }
        
    }
}
