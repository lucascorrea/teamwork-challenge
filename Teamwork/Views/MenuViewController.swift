//
//  MenuViewController.swift
//  Teamwork
//
//  Created by Lucas Correa on 13/09/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var emailLabel: UILabel!

    fileprivate let menuViewModel = MenuViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - UITableViewDataSource
extension MenuViewController: UITableViewDataSource {
    // table view data source methods
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuViewModel.menuItems.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: MenuCell = (tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as? MenuCell)!
        
        menuViewModel.configureCell(cell: &cell, indexPath: indexPath)
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension MenuViewController: UITableViewDelegate {
    // table view delegate methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        menuViewModel.didSelect(tableView: tableView, indexPath: indexPath, viewController: self)
    }
}

