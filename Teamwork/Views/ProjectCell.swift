//
//  ProjectCell.swift
//  Teamwork
//
//  Created by Lucas Correa on 13/09/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

import UIKit
import SwipeCellKit

class ProjectCell: SwipeTableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //
    // MARK: - Functions
    func configureCell(project: Project) {
        self.nameLabel.text = project.name
    }

}
