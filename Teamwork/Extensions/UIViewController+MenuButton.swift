//
//  UIViewController+MenuButton.swift
//  Teamwork
//
//  Created by Lucas Correa on 13/09/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setupBarButton(viewController: UIViewController) {
        let viewController = viewController
        
        //Button left
        let menuButton = UIButton(type: .custom)
        let menuButtonImage = UIImage(named: "menu-button")
        
        menuButton.frame = CGRect(x: 0, y: 0, width: (menuButtonImage?.size.width)!, height: (menuButtonImage?.size.height)!)
        menuButton.setImage(menuButtonImage, for: .normal)
        let backButtonView = UIView(frame: menuButton.bounds)
        backButtonView.addSubview(menuButton)
        menuButton.addTarget(self, action: #selector(SSASideMenu.presentLeftMenuViewController), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: backButtonView)
        viewController.navigationItem.leftBarButtonItem = barButton
        
        viewController.navigationItem.setLeftBarButtonItems([barButton], animated: false)
    }
    
}
