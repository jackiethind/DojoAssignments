//
//  displayViewController.swift
//  ActionSheetDemo
//
//  Created by Jackie Thind on 3/24/17.
//  Copyright © 2017 Jackie Thind. All rights reserved.
//


import UIKit

class displayViewController: UIViewController {
    
    // this creates the connection to the delegate through a REFERENCE, its asking who its delegate is going to be and leaves that to be answered by us in the previous controller class, which is the bucketlistviewcontroller class
    
    // 1
    weak var delegate: addContactViewControllerDelegate?
    
    // create a reference in order to prepopulate the name
    var firstName: String?
    var lastName: String?
    var phone: String?
    // create a reference for the indexpath of the row selected
    var indexPath: NSIndexPath?
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.doneButtonPressed(by: self)
        print("done")
    }
//    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
//        let firstName = firstNameField.text!
//        let lastName = lastNameField.text!
//        let phone = phoneField.text!
//        delegate?.contactSaved(by: self, with: firstName, lastName: lastName, phone: phone, at: indexPath)
//        print("cancel")
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = firstName! + " " + lastName!
        phoneLabel.text = phone
        
    }
}

