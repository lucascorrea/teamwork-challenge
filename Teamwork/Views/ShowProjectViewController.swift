//
//  ShowProjectViewController.swift
//  Teamwork
//
//  Created by Lucas Correa on 14/09/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ShowProjectViewController: UIViewController {

    var project: Project?
    
    @IBOutlet weak var startsLabel: UILabel!
    @IBOutlet weak var endsLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = project?.name
        
        if let logo = project?.logo {
            self.photoImageView.af_setImage(withURL: URL(string: logo)!)
        }
        
        self.descriptionTextView.text = project?.descriptionField
        
        Global.dateFormatter.dateFormat = "yyyyMMdd"
        if let st = project?.startDate {
            let stDate = Global.dateFormatter.date(from: st)
            Global.dateFormatter.dateFormat = "MMM dd yyyy"
            let stString = Global.dateFormatter.string(from: stDate!)
            self.startsLabel.text = stString.uppercased()
        }
        
        Global.dateFormatter.dateFormat = "yyyyMMdd"
        if let end = project?.endDate {
            let endDate = Global.dateFormatter.date(from: end)
            Global.dateFormatter.dateFormat = "MMM dd yyyy"
            let endString = Global.dateFormatter.string(from: endDate!)
            self.endsLabel.text = endString.uppercased()
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
