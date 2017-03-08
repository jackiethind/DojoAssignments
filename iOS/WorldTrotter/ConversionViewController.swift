//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Jackie Thind on 3/7/17.
//  Copyright © 2017 Jackie Thind. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    @IBOutlet var celsiusLabel: UILabel!
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        celsiusLabel.text = textField.text
    }
}
