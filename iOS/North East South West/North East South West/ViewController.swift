//
//  ViewController.swift
//  North East South West
//
//  Created by Jackie Thind on 3/15/17.
//  Copyright © 2017 Jackie Thind. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let direction = sender as! String
        let controller = segue.destination as! DirectionalDestinationViewController
        
        controller.direction = direction
        
    }
    @IBAction func directionButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "HAHA", sender: sender.titleLabel!.text!)
    }
    @IBAction func SegueUnwind(_ segue: UIStoryboardSegue) {
        
    }

}

