//
//  BinaryTableViewCell.swift
//  Binary Counter
//
//  Created by Jackie Thind on 3/22/17.
//  Copyright © 2017 Jackie Thind. All rights reserved.
//

import UIKit

protocol BinaryTableViewCellDelegate: class {
    func valueChangedBy(value: Int)
    
}


class BinaryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var valueLabel: UILabel!
    weak var delegate: BinaryTableViewCellDelegate?
    @IBAction func valueButtonPressed(_ sender: UIButton) {
        var value = Int(valueLabel!.text!)
        
        if sender.titleLabel!.text == "-" {
            value = -value!
        }
        delegate?.valueChangedBy(value: value!)
        
    }
   

}
