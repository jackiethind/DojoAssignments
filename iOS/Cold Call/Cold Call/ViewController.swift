//
//  ViewController.swift
//  Cold Call
//
//  Created by Jackie Thind on 3/7/17.
//  Copyright © 2017 Jackie Thind. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    let people = ["Jackie", "Jon", "Arnold", "Sam", "Patrick", "Basila", "Sarah"]
    let number = [1,2,3,4,5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func changeName(_ sender: UIButton) {
        let personNumber = Int(arc4random_uniform(UInt32(people.count)))
        nameLabel.text = people[personNumber]
        let rando = Int(arc4random_uniform(UInt32(number.count)))
        numberLabel.text = "\(number[rando])"
        if number[rando] == 1 || number[rando] == 2 {
            numberLabel.textColor = UIColor.red
        }
        else if number[rando] == 3 || number[rando] == 4 {
            numberLabel.textColor = UIColor.orange
        }
        else {
            numberLabel.textColor = UIColor.green
        }
    }

}

