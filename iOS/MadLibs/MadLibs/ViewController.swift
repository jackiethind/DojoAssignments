//
//  ViewController.swift
//  MadLibs
//
//  Created by Jackie Thind on 3/15/17.
//  Copyright © 2017 Jackie Thind. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var madLibLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Loaded first view")
        madLibLabel.text = "..."
    }

    @IBAction func SegueUnwind(_ segue: UIStoryboardSegue) {
        
        let controller = segue.source as! WordEntryViewController
        let adj = controller.adjectiveTextLabel.text!
        let verb1 = controller.verb1TextLabel.text!
        let verb2 = controller.verb2TextLabel.text!
        let noun = controller.nounTextLabel.text!
        
        let str = "We are having a perfectly \(adj) time now. Later we will \(verb1) and \(verb2) in the \(noun)."
        madLibLabel.text = str
        
    }

}

