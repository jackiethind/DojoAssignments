//
//  DirectionalDestinationViewController.swift
//  Directions Assignment
//
//  Created by Jackie Thind on 3/15/17.
//  Copyright © 2017 Jackie Thind. All rights reserved.
//

import UIKit

class DirectionalDestinationViewController: UITableViewController {

    @IBOutlet weak var GoBackButton: UIButton!
    var direction: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GoBackButton.setTitle(direction, for: .normal)

    }

   

}
