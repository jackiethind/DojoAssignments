//
//  addItemViewController.swift
//  ToDoList
//
//  Created by Jackie Thind on 3/21/17.
//  Copyright © 2017 Jackie Thind. All rights reserved.
//

import UIKit

class addItemViewController: UIViewController {
    weak var delegate: addButtonDelegate?
    
    var listItem: String?
    var listDescription: String?
    var indexPath: NSIndexPath?
    
    @IBOutlet weak var listNameEntryLabel: UITextField!
    @IBOutlet weak var listDescriptionLabel: UITextField!
    @IBOutlet weak var dateField: UIDatePicker!
    
    @IBAction func addItemButtonPressed(_ sender: UIButton) {
        let item = listNameEntryLabel.text!
        let description = listDescriptionLabel.text!
        let date = dateField.date
        let checked = false
        delegate?.addButtonPressed(by: self, with: item, description: description, date: date, checked: checked )
        print("add")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
